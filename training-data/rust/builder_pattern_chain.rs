#[derive(Debug, Default)]
struct Req { url: String, retries: u32, verbose: bool }

struct ReqBuilder(Req);
impl ReqBuilder {
    fn new(url: &str) -> Self { ReqBuilder(Req { url: url.into(), ..Default::default() }) }
    fn retries(mut self, n: u32) -> Self { self.0.retries = n; self }
    fn verbose(mut self) -> Self { self.0.verbose = true; self }
    fn build(self) -> Req { self.0 }
}

fn main() {
    println!("{:?}", ReqBuilder::new("http://x").retries(3).verbose().build());
}
