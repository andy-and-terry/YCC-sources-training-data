use std::sync::OnceLock;

static CONFIG: OnceLock<Vec<u32>> = OnceLock::new();

fn config() -> &'static Vec<u32> {
    CONFIG.get_or_init(|| { println!("init"); vec![1, 2, 3] })
}

fn main() { println!("{} {}", config().len(), config()[0]); }
