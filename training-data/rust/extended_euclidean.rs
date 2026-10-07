fn extended_gcd(a: i64, b: i64) -> (i64, i64, i64) {
    if b == 0 {
        (a, 1, 0)
    } else {
        let (g, x1, y1) = extended_gcd(b, a % b);
        (g, y1, x1 - (a / b) * y1)
    }
}

fn mod_inverse(a: i64, m: i64) -> Option<i64> {
    let (g, x, _) = extended_gcd(a, m);
    if g != 1 {
        None
    } else {
        Some(((x % m) + m) % m)
    }
}

fn main() {
    println!("{:?}", extended_gcd(35, 15));
    match mod_inverse(3, 11) {
        Some(inv) => {
            println!("{}", inv);
            assert_eq!((3 * inv) % 11, 1);
        }
        None => println!("no inverse"),
    }
}
