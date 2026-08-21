use std::collections::HashMap;

fn fibonacci(n: u64, cache: &mut HashMap<u64, u64>) -> u64 {
    if n < 2 {
        return n;
    }
    if let Some(&value) = cache.get(&n) {
        return value;
    }
    let result = fibonacci(n - 1, cache) + fibonacci(n - 2, cache);
    cache.insert(n, result);
    result
}

fn main() {
    let mut cache = HashMap::new();
    let values: Vec<u64> = (0..10).map(|n| fibonacci(n, &mut cache)).collect();
    println!("{:?}", values);
}
