fn main() {
    let v = vec![1, 2, 3, 4, 5, 6];
    let sums: Vec<i32> = v.windows(2).map(|w| w[0] + w[1]).collect();
    let chunks: Vec<i32> = v.chunks(4).map(|c| c.iter().sum()).collect();
    let zipped: Vec<(i32, char)> = v.iter().copied().zip("abc".chars()).collect();
    println!("{:?} {:?} {:?}", sums, chunks, zipped);
    let (even, odd): (Vec<i32>, Vec<i32>) = v.iter().partition(|&&x| x % 2 == 0);
    println!("{:?} {:?}", even, odd);
}
