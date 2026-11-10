fn pieces(cuts: u32) -> u32 {
    (cuts * cuts + cuts + 2) / 2
}

fn main() {
    let v: Vec<u32> = (0..10).map(pieces).collect();
    println!("{:?}", v); // [1, 2, 4, 7, 11, 16, 22, 29, 37, 46]
}
