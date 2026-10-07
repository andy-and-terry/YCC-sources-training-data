use std::collections::HashMap;
use std::sync::OnceLock;

struct Config {
    values: HashMap<&'static str, &'static str>,
}

fn config() -> &'static Config {
    static INSTANCE: OnceLock<Config> = OnceLock::new();
    INSTANCE.get_or_init(|| {
        println!("building config (runs only once)");
        let mut values = HashMap::new();
        values.insert("env", "production");
        values.insert("region", "us-east-1");
        Config { values }
    })
}

fn main() {
    for _ in 0..3 {
        let cfg = config();
        println!("{:?}", cfg.values.get("env"));
    }

    let lazy_greeting: OnceLock<String> = OnceLock::new();
    let greeting = lazy_greeting.get_or_init(|| "hello, world".to_string());
    println!("{}", greeting);
}
