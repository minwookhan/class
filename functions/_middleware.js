const SITE_MANAGEMENT_PATH = "/docs/site-management";
const PASSWORD_SHA256 = "4e6f86c20f37366420e64453a4f7c55109576532bac9caca4d38775c7473d932";

function unauthorized() {
  return new Response(
    '<!doctype html><html lang="ko"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Authentication required</title></head><body><h1>인증이 필요합니다</h1><p>사이트 관리 페이지에 접근하려면 비밀번호를 입력하세요.</p></body></html>',
    {
      status: 401,
      headers: {
        "content-type": "text/html; charset=utf-8",
        "www-authenticate": 'Basic realm="site-management", charset="UTF-8"',
      },
    },
  );
}

function shouldProtect(pathname) {
  return pathname === SITE_MANAGEMENT_PATH || pathname.startsWith(`${SITE_MANAGEMENT_PATH}/`);
}

function getPassword(request) {
  const authorization = request.headers.get("authorization") || "";
  const match = authorization.match(/^Basic\s+(.+)$/i);
  if (!match) return null;

  try {
    const decoded = atob(match[1]);
    const separator = decoded.indexOf(":");
    return separator === -1 ? null : decoded.slice(separator + 1);
  } catch {
    return null;
  }
}

async function sha256Hex(value) {
  const data = new TextEncoder().encode(value);
  const digest = await crypto.subtle.digest("SHA-256", data);
  return [...new Uint8Array(digest)]
    .map((byte) => byte.toString(16).padStart(2, "0"))
    .join("");
}

export async function onRequest(context) {
  const url = new URL(context.request.url);
  if (!shouldProtect(url.pathname)) return context.next();

  const password = getPassword(context.request);
  if (!password) return unauthorized();

  const passwordHash = await sha256Hex(password);
  if (passwordHash !== PASSWORD_SHA256) return unauthorized();

  return context.next();
}
