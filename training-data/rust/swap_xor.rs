fn swap_xor(v: &mut [u32], i: usize, j: usize) {
    if i == j {
        return;
    }
    v[i] ^= v[j];
    v[j] ^= v[i];
    v[i] ^= v[j];
}

fn main() {
    let mut v = [12, 34, 56];
    swap_xor(&mut v, 0, 2);
    println!("{:?}", v);
    v.swap(0, 1); // idiomatic
    println!("{:?}", v);
}
