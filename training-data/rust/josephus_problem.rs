fn josephus(n: u32, k: u32) -> u32 {
    let mut result = 0u32;
    for i in 2..=n {
        result = (result + k) % i;
    }
    result
}

fn josephus_simulation(n: usize, k: usize) -> usize {
    let mut people: Vec<usize> = (0..n).collect();
    let mut idx = 0usize;
    while people.len() > 1 {
        idx = (idx + k - 1) % people.len();
        people.remove(idx);
    }
    people[0]
}

fn main() {
    println!("{}", josephus(7, 3));
    println!("{}", josephus_simulation(7, 3));
    assert_eq!(josephus(41, 3) as usize, josephus_simulation(41, 3));
}
