use std::marker::PhantomData;

struct Open; struct Closed;
struct Door<S> { _s: PhantomData<S> }

impl Door<Closed> { fn new() -> Self { Door { _s: PhantomData } } fn open(self) -> Door<Open> { println!("opening"); Door { _s: PhantomData } } }
impl Door<Open> { fn close(self) -> Door<Closed> { println!("closing"); Door { _s: PhantomData } } }

fn main() { let d = Door::new().open().close(); let _ = d; }
