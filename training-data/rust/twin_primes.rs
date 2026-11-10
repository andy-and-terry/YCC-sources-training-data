fn main() {
    const LIMIT: usize = 80;
    let mut prime = [true; LIMIT + 1];
    prime[0] = false;
    prime[1] = false;
    let mut i = 2;
    while i * i <= LIMIT {
        if prime[i] {
            let mut j = i * i;
            while j <= LIMIT {
                prime[j] = false;
                j += i;
            }
        }
        i += 1;
    }
    let pairs: Vec<(usize, usize)> = (2..=LIMIT - 2)
        .filter(|&p| prime[p] && prime[p + 2])
        .map(|p| (p, p + 2))
        .collect();
    println!("{:?}", pairs); // [(3, 5), (5, 7), (11, 13), (17, 19), (29, 31), (41, 43), (59, 61), (71, 73)]
}
