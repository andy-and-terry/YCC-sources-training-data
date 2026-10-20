fn main() {
    let mut data = vec![1, 2, 3, 4, 5, 6];
    let (left, right) = data.split_at_mut(3);
    std::thread::scope(|s| {
        s.spawn(|| left.iter_mut().for_each(|x| *x *= 2));
        s.spawn(|| right.iter_mut().for_each(|x| *x += 100));
    });
    println!("{:?}", data);
}
