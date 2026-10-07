fn move_zeroes(v: &mut Vec<i32>) {
    let n = v.len();
    v.retain(|&x| x != 0);
    v.resize(n, 0);
}

fn move_zeroes_in_place(a: &mut [i32]) {
    let mut w = 0;
    for r in 0..a.len() {
        if a[r] != 0 {
            a.swap(w, r);
            w += 1;
        }
    }
}

fn main() {
    let mut v = vec![0, 1, 0, 3, 12, 0, 7];
    let mut w = v.clone();
    move_zeroes(&mut v);
    move_zeroes_in_place(&mut w);
    println!("{:?} {:?}", v, w);
}
