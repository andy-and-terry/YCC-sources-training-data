use std::marker::PhantomData;

struct Open;
struct Closed;

struct Door<State> {
    name: String,
    _state: PhantomData<State>,
}

impl Door<Closed> {
    fn new(name: &str) -> Self {
        Door { name: name.into(), _state: PhantomData }
    }
    fn open(self) -> Door<Open> {
        println!("{} opens", self.name);
        Door { name: self.name, _state: PhantomData }
    }
}

impl Door<Open> {
    fn close(self) -> Door<Closed> {
        println!("{} closes", self.name);
        Door { name: self.name, _state: PhantomData }
    }
}

struct Meters;
struct Feet;
#[derive(Debug, Clone, Copy)]
struct Length<U>(f64, PhantomData<U>);

impl Length<Feet> {
    fn to_meters(self) -> Length<Meters> {
        Length(self.0 * 0.3048, PhantomData)
    }
}

fn main() {
    let d = Door::new("front").open().close();
    let _ = d; // d.close() would not compile: the state is Closed
    println!("{:.3}", Length::<Feet>(10.0, PhantomData).to_meters().0);
}
