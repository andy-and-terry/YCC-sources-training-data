struct Meters(f64);
struct Rgb(u8, u8, u8);

impl Rgb {
    fn to_hex(&self) -> String {
        format!("#{:02X}{:02X}{:02X}", self.0, self.1, self.2)
    }
}

fn main() {
    let d = Meters(12.5);
    let Meters(inner) = d;
    println!("distance: {} m", inner);

    let orange = Rgb(255, 165, 0);
    println!("{}", orange.to_hex());
    let Rgb(r, _, _) = orange;
    println!("red channel: {}", r);
}
