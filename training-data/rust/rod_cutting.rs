fn rod_cutting(prices: &[i32], length: usize) -> i32 {
    let mut best = vec![0; length + 1];
    for n in 1..=length {
        for i in 1..=n {
            let candidate = prices[i - 1] + best[n - i];
            if candidate > best[n] {
                best[n] = candidate;
            }
        }
    }
    best[length]
}

fn main() {
    let prices = vec![1, 5, 8, 9, 10, 17, 17, 20];
    println!("{}", rod_cutting(&prices, 8));
    println!("{}", rod_cutting(&prices, 4));
}
