use std::collections::HashMap;

fn parse_ini(text: &str) -> HashMap<String, HashMap<String, String>> {
    let mut result: HashMap<String, HashMap<String, String>> = HashMap::new();
    let mut section = String::new();
    for raw_line in text.lines() {
        let line = raw_line.trim();
        if line.is_empty() || line.starts_with('#') || line.starts_with(';') {
            continue;
        }
        if line.starts_with('[') && line.ends_with(']') {
            section = line[1..line.len() - 1].to_string();
            result.insert(section.clone(), HashMap::new());
        } else if line.contains('=') && !section.is_empty() {
            let mut parts = line.splitn(2, '=');
            let key = parts.next().unwrap().trim().to_string();
            let value = parts.next().unwrap_or("").trim().to_string();
            result.get_mut(&section).unwrap().insert(key, value);
        }
    }
    result
}

fn main() {
    let sample = "\n[server]\nhost = localhost\nport = 8080\n";
    println!("{:?}", parse_ini(sample));
}
