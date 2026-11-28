fn main() {
    let n = 50;
    let mut is = vec![true; n + 1];
    is[0] = false;
    is[1] = false;
    let mut i = 2;
    while i * i <= n {
        if is[i] {
            let mut j = i * i;
            while j <= n {
                is[j] = false;
                j += i;
            }
        }
        i += 1;
    }
    for p in 3..=n - 2 {
        if is[p] && is[p + 2] {
            print!("({}, {}) ", p, p + 2);
        }
    }
    println!();
}
