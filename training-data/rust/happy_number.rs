fn step(mut n: u32) -> u32 {
    let mut s = 0;
    while n > 0 {
        s += (n % 10).pow(2);
        n /= 10;
    }
    s
}

fn is_happy(n: u32) -> bool {
    let (mut slow, mut fast) = (n, step(n));
    while fast != 1 && slow != fast {
        slow = step(slow);
        fast = step(step(fast));
    }
    fast == 1
}

fn main() {
    let happy: Vec<u32> = (1..=50).filter(|&n| is_happy(n)).collect();
    println!("{:?}", happy);
}
