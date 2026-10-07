#[derive(Debug, Clone, Default, PartialEq)]
struct Config {
    host: String,
    port: u16,
    verbose: bool,
    retries: Option<u32>,
}

#[derive(Debug, Default)]
enum Mode {
    #[default]
    Fast,
    Safe,
}

fn main() {
    let base = Config::default();
    println!("{:?}", base);

    let custom = Config {
        host: "localhost".to_string(),
        port: 8080,
        ..Default::default()
    };
    println!("{:?}", custom);

    let derived = Config { verbose: true, ..custom.clone() };
    println!("{} {}", derived == custom, derived.verbose);
    println!("{:?} {:?}", Mode::default(), Mode::Safe);
    let (a, b): (i32, String) = Default::default();
    println!("{} {:?}", a, b);
}
