fn main() {
    let data = [1u8, 2, 3, 4, 5, 6, 7];
    let chunks = data.chunks_exact(3);
    let rem = chunks.remainder();
    for c in data.chunks_exact(3) {
        println!("chunk {:?} sum={}", c, c.iter().map(|&b| b as u32).sum::<u32>());
    }
    println!("remainder {:?}", rem);

    let (head, tail) = data.split_at(2);
    println!("{:?} | {:?}", head, tail);

    if let Some((first, rest)) = data.split_first() {
        println!("first={} rest_len={}", first, rest.len());
    }
    for c in data.rchunks(3) {
        println!("rchunk {:?}", c);
    }
}
