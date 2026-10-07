export interface ParsedUrl {
  scheme: string;
  user?: string;
  password?: string;
  host: string;
  port?: number;
  path: string;
  query: Record<string, string>;
  fragment?: string;
}

const URL_RE =
  /^(?<scheme>[a-z][a-z0-9+.-]*):\/\/(?:(?<user>[^:@/]+)(?::(?<password>[^@/]*))?@)?(?<host>[^:/?#]+)(?::(?<port>\d+))?(?<path>\/[^?#]*)?(?:\?(?<query>[^#]*))?(?:#(?<fragment>.*))?$/i;
const DEFAULT_PORTS: Record<string, number> = { http: 80, https: 443, ftp: 21 };

export function parseUrl(url: string): ParsedUrl {
  const g = URL_RE.exec(url)?.groups;
  if (!g) throw new SyntaxError(`invalid url: ${url}`);
  const query: Record<string, string> = {};
  for (const pair of (g.query ?? "").split("&").filter(Boolean)) {
    const [k, v = ""] = pair.split("=");
    query[decodeURIComponent(k)] = decodeURIComponent(v);
  }
  return {
    scheme: g.scheme.toLowerCase(),
    user: g.user,
    password: g.password,
    host: g.host.toLowerCase(),
    port: g.port ? Number(g.port) : DEFAULT_PORTS[g.scheme.toLowerCase()],
    path: g.path || "/",
    query,
    fragment: g.fragment,
  };
}

console.log(parseUrl("HTTPS://user:pw@Example.com:8443/a/b?x=1&y=hello%20world#top"));
console.log(parseUrl("http://localhost"));
