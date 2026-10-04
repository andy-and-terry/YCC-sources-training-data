use std::fmt;

struct Money(i64); // cents

impl fmt::Display for Money {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let s = format!("${}.{:02}", self.0 / 100, self.0 % 100);
        f.pad(&s)
    }
}

struct Bits(u8);

impl fmt::Binary for Bits {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Binary::fmt(&self.0, f)
    }
}

#[derive(Debug)]
struct Item {
    id: u32,
    tags: Vec<&'static str>,
}

fn main() {
    println!("[{:>10}]", Money(12345));
    println!("[{:<10}]", Money(7));
    println!("[{:^10}]", Money(99900));
    println!("[{:*^9}]", "mid");
    println!("[{:08.3}]", 3.14159);
    println!("[{:+}] [{:#x}] [{:#010b}]", 42, 255, 5);
    println!("{:b} {:#b}", Bits(10), Bits(10));
    let width = 6;
    let prec = 2;
    println!("[{:width$.prec$}]", 2.71828);
    println!("[{:>1$}]", "ab", 5);
    println!("{:?}", Item { id: 1, tags: vec!["a", "b"] });
    println!("{:#?}", Item { id: 2, tags: vec!["c"] });
    println!("{{literal}} {0} {0:?} {name}", "x", name = "n");
}
