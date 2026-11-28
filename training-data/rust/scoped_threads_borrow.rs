use std::thread;

fn main() {
    let data = vec![1, 2, 3, 4, 5, 6];
    let (l, r) = data.split_at(3);
    let (a, b) = thread::scope(|s| {
        let h1 = s.spawn(|| l.iter().sum::<i32>());
        let h2 = s.spawn(|| r.iter().sum::<i32>());
        (h1.join().unwrap(), h2.join().unwrap())
    });
    println!("{a} {b}");
}
