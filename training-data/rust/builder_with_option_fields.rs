#[derive(Debug)]
struct ServerConfig {
    host: String,
    port: u16,
    timeout_secs: u32,
}

#[derive(Default)]
struct ServerConfigBuilder {
    host: Option<String>,
    port: Option<u16>,
    timeout_secs: Option<u32>,
}

impl ServerConfigBuilder {
    fn host(mut self, host: &str) -> Self {
        self.host = Some(host.to_string());
        self
    }

    fn port(mut self, port: u16) -> Self {
        self.port = Some(port);
        self
    }

    fn timeout_secs(mut self, timeout: u32) -> Self {
        self.timeout_secs = Some(timeout);
        self
    }

    fn build(self) -> ServerConfig {
        ServerConfig {
            host: self.host.unwrap_or_else(|| "localhost".to_string()),
            port: self.port.unwrap_or(8080),
            timeout_secs: self.timeout_secs.unwrap_or(30),
        }
    }
}

fn main() {
    let config = ServerConfigBuilder::default().port(9090).timeout_secs(60).build();
    println!("{:?}", config);
}
