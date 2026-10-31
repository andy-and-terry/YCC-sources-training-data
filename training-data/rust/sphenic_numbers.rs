fn is_sphenic(mut n: u32) -> bool {
    let mut distinct = 0;
    let mut p = 2;
    while p * p <= n {
        if n % p == 0 {
            n /= p;
            if n % p == 0 {
                return false;
            }
            distinct += 1;
        }
        p += 1;
    }
    if n > 1 {
        distinct += 1;
    }
    distinct == 3
}

fn main() {
    let result: Vec<u32> = (2..80).filter(|&n| is_sphenic(n)).collect();
    println!("{:?}", result);
}
