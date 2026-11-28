#[derive(Debug, Default)]
struct Request {
    url: String,
    retries: u8,
    verbose: bool,
}

struct RequestBuilder(Request);

impl RequestBuilder {
    fn new(url: &str) -> Self {
        Self(Request { url: url.into(), ..Default::default() })
    }
    fn retries(mut self, n: u8) -> Self { self.0.retries = n; self }
    fn verbose(mut self) -> Self { self.0.verbose = true; self }
    fn build(self) -> Request { self.0 }
}

fn main() {
    println!("{:?}", RequestBuilder::new("http://x").retries(3).verbose().build());
}
