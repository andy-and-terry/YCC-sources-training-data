use std::collections::BTreeMap;

#[allow(dead_code)] // fields are only read through Debug
#[derive(Debug, Default)]
struct Url {
    scheme: String,
    userinfo: Option<String>,
    host: String,
    port: Option<u16>,
    path: String,
    query: BTreeMap<String, String>,
    fragment: Option<String>,
}

fn parse_url(s: &str) -> Result<Url, String> {
    let (scheme, rest) = s.split_once("://").ok_or("missing scheme")?;
    let (rest, fragment) = match rest.split_once('#') {
        Some((r, f)) => (r, Some(f.to_string())),
        None => (rest, None),
    };
    let (rest, query) = rest.split_once('?').unwrap_or((rest, ""));
    let (authority, path) = match rest.find('/') {
        Some(i) => (&rest[..i], &rest[i..]),
        None => (rest, "/"),
    };
    let (userinfo, hostport) = match authority.rsplit_once('@') {
        Some((u, h)) => (Some(u.to_string()), h),
        None => (None, authority),
    };
    let (host, port) = match hostport.rsplit_once(':') {
        Some((h, p)) => (h, Some(p.parse::<u16>().map_err(|e| format!("bad port {:?}: {}", p, e))?)),
        None => (hostport, None),
    };
    let default_port = match scheme {
        "http" => Some(80),
        "https" => Some(443),
        _ => None,
    };
    let query = query
        .split('&')
        .filter(|p| !p.is_empty())
        .map(|p| {
            let (k, v) = p.split_once('=').unwrap_or((p, ""));
            (k.to_string(), v.to_string())
        })
        .collect();
    Ok(Url {
        scheme: scheme.to_string(),
        userinfo,
        host: host.to_string(),
        port: port.or(default_port),
        path: path.to_string(),
        query,
        fragment,
    })
}

fn main() {
    for s in ["https://user:pw@example.com:8443/a/b?x=1&y=2#top", "http://localhost", "http://h:99999/", "nope"] {
        match parse_url(s) {
            Ok(u) => println!("{:?}", u),
            Err(e) => println!("{}: error: {}", s, e),
        }
    }
}
