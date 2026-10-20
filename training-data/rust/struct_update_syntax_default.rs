#[derive(Debug, Clone, Default)]
struct Config { host: String, port: u16, verbose: bool }

fn main() {
    let base = Config { host: "localhost".into(), port: 80, ..Default::default() };
    let dev = Config { port: 8080, verbose: true, ..base.clone() };
    println!("{:?}\n{:?}", base, dev);
}
