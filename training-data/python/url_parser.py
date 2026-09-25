import re

URL_RE = re.compile(
    r"^(?P<scheme>[a-zA-Z][a-zA-Z0-9+.-]*)://"
    r"(?:(?P<user>[^:@/]+)(?::(?P<password>[^@/]*))?@)?"
    r"(?P<host>[^:/?#]+)"
    r"(?::(?P<port>\d+))?"
    r"(?P<path>/[^?#]*)?"
    r"(?:\?(?P<query>[^#]*))?"
    r"(?:#(?P<fragment>.*))?$"
)

DEFAULT_PORTS = {"http": 80, "https": 443, "ftp": 21}


def parse_url(url):
    m = URL_RE.match(url)
    if not m:
        raise ValueError(f"invalid url: {url}")
    parts = m.groupdict()
    parts["port"] = int(parts["port"]) if parts["port"] else DEFAULT_PORTS.get(parts["scheme"])
    parts["path"] = parts["path"] or "/"
    return parts


if __name__ == "__main__":
    for u in ("https://user:pw@example.com:8443/a/b?x=1&y=2#top", "http://localhost"):
        print(parse_url(u))
