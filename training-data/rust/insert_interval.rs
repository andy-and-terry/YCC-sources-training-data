fn insert_interval(iv: &[(i32, i32)], mut new: (i32, i32)) -> Vec<(i32, i32)> {
    let mut out = Vec::new();
    let mut i = 0;
    while i < iv.len() && iv[i].1 < new.0 {
        out.push(iv[i]);
        i += 1;
    }
    while i < iv.len() && iv[i].0 <= new.1 {
        new = (new.0.min(iv[i].0), new.1.max(iv[i].1));
        i += 1;
    }
    out.push(new);
    out.extend_from_slice(&iv[i..]);
    out
}

fn main() {
    println!("{:?}", insert_interval(&[(1, 3), (6, 9)], (2, 5))); // [(1, 5), (6, 9)]
}
