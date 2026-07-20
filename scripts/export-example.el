;;; export-example.el --- Export example.org to one Hugo chapter file -*- lexical-binding: t; -*-

(require 'ox-md)
(require 'subr-x)
(require 'url-util)

(setq org-export-with-toc nil
      org-export-with-section-numbers nil
      org-export-with-smart-quotes nil
      org-export-with-sub-superscripts nil)

(defun site/markdown-fence (code)
  "Return a tilde fence longer than any tilde run in CODE."
  (let ((max-run 0)
        (start 0))
    (while (string-match "~+" code start)
      (setq max-run (max max-run (- (match-end 0) (match-beginning 0)))
            start (match-end 0)))
    (make-string (max 3 (1+ max-run)) ?~)))

(defun site/markdown-src-block (src-block _contents _info)
  "Transcode SRC-BLOCK to a fenced Markdown code block."
  (let* ((raw-lang (or (org-element-property :language src-block) "text"))
         (lang (if (string= raw-lang "jupyter-python") "python" raw-lang))
         (code (string-trim-right (org-element-property :value src-block)))
         (fence (site/markdown-fence code)))
    (format "%s%s\n%s\n%s\n" fence lang code fence)))

(defun site/markdown-table-cell (text)
  "Return TEXT escaped for use inside a Markdown table cell."
  (let ((cell (string-trim (replace-regexp-in-string "[[:space:]]+" " " (or text "")))))
    (replace-regexp-in-string "|" "\\|" cell t t)))

(defun site/markdown-table-row (cells)
  "Return a Markdown table row from CELLS."
  (concat "| " (string-join cells " | ") " |"))

(defun site/markdown-table (table _contents info)
  "Transcode Org TABLE to a Markdown pipe table."
  (let (rows)
    (org-element-map table (quote table-row)
      (lambda (row)
        (unless (eq (org-element-property :type row) (quote rule))
          (let (cells)
            (org-element-map row (quote table-cell)
              (lambda (cell)
                (push (site/markdown-table-cell
                       (org-export-data (org-element-contents cell) info))
                      cells))
              info nil (quote table-cell))
            (push (nreverse cells) rows))))
      info nil (quote table-row))
    (setq rows (nreverse rows))
    (when rows
      (let* ((column-count (apply (function max) (mapcar (function length) rows)))
             (normalize (lambda (row)
                          (append row (make-list (- column-count (length row)) ""))))
             (header (funcall normalize (car rows)))
             (body (mapcar normalize (cdr rows)))
             (separator (make-list column-count "---")))
        (concat
         (mapconcat (function site/markdown-table-row)
                    (append (list header separator) body)
                    "\n")
         "\n")))))

(defvar site/export-source-dir nil)
(defvar site/export-static-dir nil)

(defconst site/image-extensions
  '("avif" "gif" "jpeg" "jpg" "png" "svg" "webp"))

(defun site/file-link-asset-p (path)
  "Return non-nil when PATH should be copied as a local web asset."
  (and path
       (not (string-match-p "\\`[a-zA-Z][a-zA-Z0-9+.-]*:" path))))

(defun site/asset-url-name (file)
  "Return a URL-safe asset name for FILE."
  (mapconcat #'url-hexify-string (split-string file "/") "/"))

(defun site/image-file-p (file)
  "Return non-nil when FILE has a web image extension."
  (member (downcase (or (file-name-extension file) "")) site/image-extensions))

(defun site/html-escape-attribute (value)
  "Return VALUE escaped for use in a double-quoted HTML attribute."
  (let ((text (format "%s" value)))
    (setq text (replace-regexp-in-string "&" "&amp;" text t t))
    (setq text (replace-regexp-in-string "\"" "&quot;" text t t))
    (setq text (replace-regexp-in-string "<" "&lt;" text t t))
    (setq text (replace-regexp-in-string ">" "&gt;" text t t))
    text))

(defun site/attr-plist (link attr-key)
  "Return LINK's affiliated ATTR-KEY keywords as a plist."
  (let ((element link)
        lines
        attrs)
    (while (and element (not lines))
      (setq lines (org-element-property attr-key element))
      (setq element (org-element-property :parent element)))
    (dolist (line lines)
      (let ((tokens (split-string-and-unquote line)))
        (while tokens
          (let ((key (pop tokens))
                (value (pop tokens)))
            (when (and value (string-prefix-p ":" key))
              (setq attrs (plist-put attrs (intern key) value)))))))
    attrs))

(defun site/merge-plists (base override)
  "Return BASE plist with OVERRIDE keys applied."
  (let ((result base))
    (while override
      (setq result (plist-put result (pop override) (pop override))))
    result))

(defun site/image-attr-plist (link)
  "Return image attributes from ATTR_ORG and ATTR_HTML for LINK.

ATTR_HTML overrides ATTR_ORG when both define the same key."
  (site/merge-plists
   (site/attr-plist link :attr_org)
   (site/attr-plist link :attr_html)))

(defun site/html-normalize-dimension (key value)
  "Normalize VALUE for width/height HTML attributes."
  (let ((text (format "%s" value)))
    (if (and (memq key (quote (:width :height)))
             (string-match (rx string-start (group (+ digit)) "px" string-end) text))
        (match-string 1 text)
      text)))

(defun site/html-attrs (attrs allowed)
  "Return escaped HTML attributes from ATTRS, limited to ALLOWED keys."
  (mapconcat
   (function identity)
   (delq nil
         (mapcar
          (lambda (key)
            (let ((value (plist-get attrs key)))
              (when (and value (not (string-empty-p value)))
                (format "%s=\"%s\""
                        (string-remove-prefix ":" (symbol-name key))
                        (site/html-escape-attribute
                         (site/html-normalize-dimension key value))))))
          allowed))
   " "))

(defun site/markdown-image (url label attrs)
  "Return Markdown or HTML image markup for URL with LABEL and ATTRS."
  (let* ((alt (or (plist-get attrs :alt) label))
         (html-attrs (string-trim
                      (site/html-attrs attrs '(:width :height :class :style :loading)))))
    (if (not (string-empty-p html-attrs))
        (format "<img src=\"%s\" alt=\"%s\" %s>"
                (site/html-escape-attribute url)
                (site/html-escape-attribute alt)
                html-attrs)
      (format "![%s](%s)" label url))))

(defun site/asset-destination (source)
  "Return a non-conflicting destination path for SOURCE under static/org-assets."
  (let* ((asset-dir (expand-file-name "org-assets" site/export-static-dir))
         (prefix (substring (secure-hash 'sha1 (expand-file-name source)) 0 8))
         (base (file-name-nondirectory source))
         (dest (expand-file-name (format "%s-%s" prefix base) asset-dir)))
    (make-directory asset-dir t)
    dest))

(defun site/copy-file-link-asset (path)
  "Copy local file link PATH into static/org-assets and return its public URL."
  (let* ((source (expand-file-name path site/export-source-dir)))
    (if (not (file-exists-p source))
        (progn
          (message "Missing linked asset: %s" source)
          path)
      (let* ((dest (site/asset-destination source))
             (url (concat "/org-assets/"
                          (site/asset-url-name (file-name-nondirectory dest)))))
        (copy-file source dest t)
        url))))

(defun site/markdown-link (link contents info)
  "Transcode LINK to Markdown, copying local file links into static/org-assets."
  (let ((type (org-element-property :type link))
        (path (org-element-property :path link)))
    (if (and (string= type "file") (site/file-link-asset-p path))
        (let* ((url (site/copy-file-link-asset path))
               (label (or contents (file-name-nondirectory path)))
               (attrs (site/image-attr-plist link)))
          (if (site/image-file-p path)
              (site/markdown-image url label attrs)
            (format "[%s](%s)" label url)))
      (org-md-link link contents info))))

(org-export-define-derived-backend 'site-hugo-md 'md
  :translate-alist '((src-block . site/markdown-src-block)
                     (table . site/markdown-table)
                     (link . site/markdown-link))
  :menu-entry
  '(?H "Export to Hugo"
       ((?H "To Hugo markdown file"
            (lambda (_async _subtreep _visible-only _body-only)
              (site/export-org-to-hugo))))))

(defconst site/default-root
  (expand-file-name ".." (file-name-directory (or load-file-name buffer-file-name)))
  "Default Hugo project root, relative to this script.")

(defun site/yaml-quote (value)
  "Return VALUE as a double-quoted YAML scalar."
  (concat "\""
          (replace-regexp-in-string
           "\"" "\\\\\""
           (replace-regexp-in-string "\\\\" "\\\\\\\\" value))
          "\""))

(defun site/org-keyword (keyword &optional default)
  "Return Org KEYWORD value from the current buffer, or DEFAULT."
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (if (re-search-forward
           (format "^#\\+%s:[ \\t]*\\(.*\\)$" (regexp-quote keyword))
           nil t)
          (string-trim (match-string-no-properties 1))
        default))))

(defun site/custom-front-matter-value (key &optional default)
  "Return KEY value from #+hugo_custom_front_matter, or DEFAULT."
  (let ((tokens (split-string-and-unquote
                 (or (site/org-keyword "hugo_custom_front_matter") "")))
        value)
    (while tokens
      (let ((token (pop tokens)))
        (if (string= token key)
            (setq value (pop tokens))
          (when tokens (pop tokens)))))
    (or value default)))

(defun site/export-target-from-keywords (root source)
  "Return Hugo Markdown target path from Org keywords in ROOT for SOURCE."
  (let* ((section (or (getenv "SITE_HUGO_SECTION")
                      (site/org-keyword "hugo_section")
                      "docs/machine-learning/bitcoin-price-prediction"))
         (section (string-remove-prefix "/" section))
         (section (string-remove-prefix "content/" section))
         (name (or (getenv "SITE_EXPORT_FILE_NAME")
                   (site/org-keyword "export_file_name")
                   (file-name-base source))))
    (expand-file-name (format "content/%s/%s.md" section name) root)))

(defun site/export-org-to-hugo (&optional source target root)
  "Export an Org file to one Hugo Markdown chapter.

When called interactively from an Org buffer, use that buffer as SOURCE.
The target can be controlled with these Org keywords:

  #+hugo_base_dir: ~/Documents/hugo_doc
  #+hugo_section: docs/machine-learning/bitcoin-price-prediction
  #+export_file_name: example"
  (interactive)
  (let* ((source (expand-file-name
                  (or source
                      (getenv "SITE_ORG_SOURCE")
                      (and (derived-mode-p 'org-mode) buffer-file-name)
                      "example.org")
                  site/default-root)))
    (with-current-buffer (find-file-noselect source)
      (org-mode)
      (when (and (called-interactively-p 'interactive)
                 (buffer-modified-p))
        (save-buffer))
      (let* ((root (expand-file-name
                    (or root
                        (getenv "SITE_HUGO_ROOT")
                        (site/org-keyword "hugo_base_dir")
                        site/default-root)))
             (target (expand-file-name
                      (or target
                          (getenv "SITE_HUGO_TARGET")
                          (site/export-target-from-keywords root source))
                      root))
             (site/export-source-dir (file-name-directory source))
             (site/export-static-dir (expand-file-name "static" root))
             (title (site/org-keyword "title" "Example"))
             (weight (site/custom-front-matter-value ":weight" "1"))
             (toc (site/custom-front-matter-value ":toc" "true"))
             (body (org-export-as 'site-hugo-md nil nil t
                                  '(:with-title nil
                                    :with-toc nil
                                    :section-numbers nil
                                    :with-sub-superscript nil))))
        (make-directory (file-name-directory target) t)
        (with-temp-file target
          (insert "---\n")
          (insert "title: " (site/yaml-quote title) "\n")
          (insert "linkTitle: " (site/yaml-quote title) "\n")
          (insert "weight: " weight "\n")
          (insert "toc: " toc "\n")
          (insert "---\n\n")
          (insert body)
          (unless (string-suffix-p "\n" body)
            (insert "\n")))
        (message "Exported %s -> %s" source target)
        target))))

(when (and noninteractive (getenv "SITE_ORG_SOURCE"))
  (site/export-org-to-hugo))

(provide 'export-example)
