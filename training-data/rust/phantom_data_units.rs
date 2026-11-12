use std::marker::PhantomData;

struct Meters;
struct Feet;
struct Length<U>(f64, PhantomData<U>);

impl<U> Length<U> {
    fn new(v: f64) -> Self { Length(v, PhantomData) }
}
impl Length<Feet> {
    fn to_meters(&self) -> Length<Meters> { Length::new(self.0 * 0.3048) }
}

fn main() {
    let m = Length::<Feet>::new(10.0).to_meters();
    println!("{:.3}", m.0);
}
