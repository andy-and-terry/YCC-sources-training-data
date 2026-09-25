const URL_RE =
  /^([a-zA-Z][a-zA-Z0-9+.-]*):\/\/(?:([^:@/]+)(?::([^@/]*))?@)?([^:/?#]+)(?::(\d+))?(\/[^?#]*)?(?:\?([^#]*))?(?:#(.*))?$/;
const DEFAULT_PORTS = { http: 80, https: 443, ftp: 21 };

function parseUrl(url) {
  const m = URL_RE.exec(url);
  if (!m) throw new Error(`invalid url: ${url}`);
  const [, scheme, user, password, host, port, path, query, fragment] = m;
  return {
    scheme,
    user: user ?? null,
    password: password ?? null,
    host,
    port: port ? Number(port) : DEFAULT_PORTS[scheme] ?? null,
    path: path || "/",
    query: query ?? null,
    fragment: fragment ?? null,
  };
}

console.log(parseUrl("https://user:pw@example.com:8443/a/b?x=1&y=2#top"));
console.log(parseUrl("http://localhost"));
module.exports = { parseUrl };
