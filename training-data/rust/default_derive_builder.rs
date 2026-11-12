#[derive(Debug, Default, Clone)]
struct Options { name: String, retries: u32, verbose: bool }

impl Options {
    fn name(mut self, n: &str) -> Self { self.name = n.into(); self }
    fn retries(mut self, r: u32) -> Self { self.retries = r; self }
}

fn main() {
    let o = Options::default().name("job").retries(3);
    println!("{:?}", o);
}
