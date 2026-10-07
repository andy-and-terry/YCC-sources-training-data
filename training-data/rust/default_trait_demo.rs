#[derive(Debug, Default, Clone)]
struct ServerConfig {
    host: String,
    port: u16,
    max_connections: u32,
    verbose: bool,
}

#[derive(Debug)]
struct Timer {
    elapsed_ms: u64,
}

impl Default for Timer {
    fn default() -> Self {
        // A hand-written Default, unlike the derived one above.
        Timer { elapsed_ms: 0 }
    }
}

fn main() {
    let default_config = ServerConfig::default();
    println!("{:?}", default_config);

    // Struct update syntax layered on top of a Default value.
    let custom_config = ServerConfig { port: 8080, verbose: true, ..Default::default() };
    println!("{:?}", custom_config);

    let timer: Timer = Default::default();
    println!("{:?}", timer);

    assert_eq!(default_config.host, "");
    assert_eq!(default_config.max_connections, 0);
}
