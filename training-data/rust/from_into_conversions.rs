struct Celsius(f64);
struct Fahrenheit(f64);

impl From<Celsius> for Fahrenheit { fn from(c: Celsius) -> Self { Fahrenheit(c.0 * 9.0 / 5.0 + 32.0) } }

fn main() {
    let f: Fahrenheit = Celsius(100.0).into();
    println!("{}", f.0);
    let s: String = 'x'.into();
    let n: i64 = i32::MAX.into();
    println!("{} {}", s, n);
    println!("{:?}", u8::try_from(300i32).is_err());
}
