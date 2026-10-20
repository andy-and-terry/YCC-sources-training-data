use std::fmt::Write;

fn table(rows: &[(&str, f64)]) -> String {
    let mut out = String::new();
    writeln!(out, "{:<8}|{:>8}", "item", "price").unwrap();
    writeln!(out, "{:-<8}+{:->8}", "", "").unwrap();
    for (name, price) in rows {
        writeln!(out, "{name:<8}|{price:>8.2}").unwrap();
    }
    out
}

fn main() {
    print!("{}", table(&[("tea", 3.5), ("cake", 12.25)]));
    let mut s = String::new();
    write!(s, "{:#x} {:#b} {:+} {:e}", 255, 5, 7, 1234.5).unwrap();
    println!("{s}");
    println!("{:?} {:>5}|{:^5}|{:<5}|", "q\"s", "r", "c", "l");
}
