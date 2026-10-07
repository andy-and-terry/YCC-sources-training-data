use std::collections::HashMap;

#[allow(dead_code)] // fields are only read through Debug
#[derive(Debug)]
enum RenderError {
    Unclosed(usize),
    UnknownVar(String),
    UnknownFilter(String),
}

fn render(tpl: &str, ctx: &HashMap<&str, String>) -> Result<String, RenderError> {
    let mut out = String::new();
    let mut rest = tpl;
    let mut offset = 0;
    while let Some(start) = rest.find("{{") {
        out.push_str(&rest[..start]);
        let after = &rest[start + 2..];
        let end = after.find("}}").ok_or(RenderError::Unclosed(offset + start))?;
        let mut parts = after[..end].split('|').map(str::trim);
        let name = parts.next().unwrap_or("");
        let mut value = ctx.get(name).cloned().ok_or_else(|| RenderError::UnknownVar(name.to_string()))?;
        for filter in parts {
            value = match filter {
                "upper" => value.to_uppercase(),
                "lower" => value.to_lowercase(),
                "trim" => value.trim().to_string(),
                "len" => value.chars().count().to_string(),
                other => return Err(RenderError::UnknownFilter(other.to_string())),
            };
        }
        out.push_str(&value);
        offset += start + 2 + end + 2;
        rest = &after[end + 2..];
    }
    out.push_str(rest);
    Ok(out)
}

fn main() {
    let ctx = HashMap::from([("name", "  Ada ".to_string()), ("count", "3".into()), ("kind", "messages".into())]);
    println!("{:?}", render("Hello {{ name | trim }}, you have {{count}} new {{ kind | upper }}.", &ctx));
    println!("{:?}", render("{{ missing }}", &ctx));
    println!("{:?}", render("{{ kind | reverse }}", &ctx));
    println!("{:?}", render("oops {{ kind ", &ctx));
}
