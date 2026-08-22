use std::collections::HashMap;

type Rule = Box<dyn Fn(&str) -> bool>;

fn required() -> Rule {
    Box::new(|value: &str| !value.is_empty())
}

fn is_email() -> Rule {
    Box::new(|value: &str| value.contains('@') && value.contains('.'))
}

fn min_length(n: usize) -> Rule {
    Box::new(move |value: &str| value.len() >= n)
}

fn validate(data: &HashMap<&str, &str>, schema: &HashMap<&str, Vec<Rule>>) -> HashMap<String, Vec<String>> {
    let mut errors = HashMap::new();
    for (field, rules) in schema {
        for rule in rules {
            let value = data.get(field).copied().unwrap_or("");
            if !rule(value) {
                errors.entry(field.to_string()).or_insert_with(Vec::new).push("invalid".to_string());
            }
        }
    }
    errors
}

fn main() {
    let mut data = HashMap::new();
    data.insert("email", "not-an-email");
    data.insert("password", "short");

    let mut schema: HashMap<&str, Vec<Rule>> = HashMap::new();
    schema.insert("email", vec![required(), is_email()]);
    schema.insert("password", vec![required(), min_length(8)]);

    println!("{:?}", validate(&data, &schema));
}
