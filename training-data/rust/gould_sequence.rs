fn gould(n: u32) -> u32 {
    1 << n.count_ones()
}

fn main() {
    let v: Vec<u32> = (0..16).map(gould).collect();
    println!("{:?}", v);
}
