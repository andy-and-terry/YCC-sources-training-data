// Farey sequence F_n via the next-term recurrence.
fn farey(n: i32) -> Vec<String> {
    let mut out = vec!["0/1".to_string()];
    let (mut a, mut b, mut c, mut d) = (0, 1, 1, n);
    while c <= n {
        let k = (n + b) / d;
        let next = (c, d, k * c - a, k * d - b);
        a = next.0;
        b = next.1;
        c = next.2;
        d = next.3;
        out.push(format!("{}/{}", a, b));
        if a == 1 && b == 1 {
            break;
        }
    }
    out
}

fn main() {
    println!("{}", farey(5).join(" "));
}
