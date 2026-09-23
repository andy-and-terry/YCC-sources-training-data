// `#[derive(Default)]` and a hand-written `impl Default` both give a
// type a "zero value" constructor, which pairs nicely with struct
// update syntax (`..Default::default()`) to set only a few fields.
#[derive(Debug, Default)]
struct ServerConfig {
    host: String,
    port: u16,
    timeout_secs: u32,
    verbose: bool,
}

#[derive(Debug)]
struct RetryPolicy {
    max_attempts: u32,
    backoff_ms: u64,
}

impl Default for RetryPolicy {
    fn default() -> Self {
        RetryPolicy { max_attempts: 3, backoff_ms: 200 }
    }
}

fn main() {
    // Derived Default: every field gets its type's default (empty
    // string, 0, false).
    let blank = ServerConfig::default();
    println!("{:?}", blank);

    // Struct update syntax: start from the default, override two fields.
    let custom = ServerConfig {
        host: "localhost".to_string(),
        port: 8080,
        ..Default::default()
    };
    println!("{:?}", custom);

    // Hand-written Default for a type where "zero" isn't a sane default.
    let retry = RetryPolicy::default();
    println!("{:?}", retry);
    assert_eq!(retry.max_attempts, 3);
}
