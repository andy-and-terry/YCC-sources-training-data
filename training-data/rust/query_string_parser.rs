use std::collections::BTreeMap;

fn percent_decode(s: &str) -> Result<String, String> {
    let bytes = s.as_bytes();
    let mut out = Vec::with_capacity(bytes.len());
    let mut i = 0;
    while i < bytes.len() {
        match bytes[i] {
            b'+' => out.push(b' '),
            b'%' => {
                let hex = s.get(i + 1..i + 3).ok_or("truncated escape")?;
                out.push(u8::from_str_radix(hex, 16).map_err(|_| format!("bad escape %{}", hex))?);
                i += 2;
            }
            b => out.push(b),
        }
        i += 1;
    }
    String::from_utf8(out).map_err(|e| e.to_string())
}

fn percent_encode(s: &str) -> String {
    s.bytes()
        .map(|b| match b {
            b'A'..=b'Z' | b'a'..=b'z' | b'0'..=b'9' | b'-' | b'_' | b'.' | b'~' => (b as char).to_string(),
            _ => format!("%{:02X}", b),
        })
        .collect()
}

fn parse(qs: &str) -> Result<BTreeMap<String, Vec<String>>, String> {
    let mut out: BTreeMap<String, Vec<String>> = BTreeMap::new();
    for pair in qs.trim_start_matches('?').split('&').filter(|p| !p.is_empty()) {
        let (k, v) = pair.split_once('=').unwrap_or((pair, ""));
        out.entry(percent_decode(k)?).or_default().push(percent_decode(v)?);
    }
    Ok(out)
}

fn main() {
    let q = parse("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=").unwrap();
    println!("{:?}", q);
    let rebuilt: Vec<String> = q.iter().flat_map(|(k, vs)| vs.iter().map(move |v| format!("{}={}", percent_encode(k), percent_encode(v)))).collect();
    println!("{}", rebuilt.join("&"));
    println!("{:?}", parse("bad=%zz"));
}
