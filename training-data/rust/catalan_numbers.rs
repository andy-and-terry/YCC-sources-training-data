fn catalan(n: usize) -> Vec<u128> {
    let mut c = vec![0u128; n + 1];
    c[0] = 1;
    for i in 1..=n {
        c[i] = (0..i).map(|j| c[j] * c[i - 1 - j]).sum();
    }
    c
}

/// Enumerates Dyck paths (U/D steps) of semilength n.
fn dyck_paths(n: usize) -> Vec<String> {
    fn go(up: usize, down: usize, n: usize, cur: &mut String, out: &mut Vec<String>) {
        if cur.len() == 2 * n {
            out.push(cur.clone());
            return;
        }
        if up < n {
            cur.push('U');
            go(up + 1, down, n, cur, out);
            cur.pop();
        }
        if down < up {
            cur.push('D');
            go(up, down + 1, n, cur, out);
            cur.pop();
        }
    }
    let mut out = Vec::new();
    go(0, 0, n, &mut String::new(), &mut out);
    out
}

fn main() {
    let c = catalan(60);
    for i in [0, 5, 10, 30, 60] {
        println!("C({}) = {}", i, c[i]);
    }
    println!("{:?}", dyck_paths(3));
    println!("dyck(6) count matches: {}", dyck_paths(6).len() as u128 == c[6]);
}
