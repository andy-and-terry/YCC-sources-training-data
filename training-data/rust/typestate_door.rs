use std::marker::PhantomData;

struct Open;
struct Closed;

struct Door<S> {
    _state: PhantomData<S>,
}

impl Door<Closed> {
    fn new() -> Self {
        Door { _state: PhantomData }
    }
    fn open(self) -> Door<Open> {
        println!("opening");
        Door { _state: PhantomData }
    }
}

impl Door<Open> {
    fn close(self) -> Door<Closed> {
        println!("closing");
        Door { _state: PhantomData }
    }
}

fn main() {
    let d = Door::new().open().close();
    let _ = d;
}
