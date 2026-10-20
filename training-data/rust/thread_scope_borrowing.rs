use std::thread;

fn main() {
    let mut data = vec![1, 2, 3, 4, 5, 6];
    let total: i32 = {
        let (left, right) = data.split_at_mut(3);
        thread::scope(|s| {
            let h1 = s.spawn(|| {
                left.iter_mut().for_each(|x| *x *= 10);
                left.iter().sum::<i32>()
            });
            let h2 = s.spawn(|| {
                right.iter_mut().for_each(|x| *x += 1);
                right.iter().sum::<i32>()
            });
            h1.join().unwrap() + h2.join().unwrap()
        })
    };
    println!("{total} {:?}", data);
}
