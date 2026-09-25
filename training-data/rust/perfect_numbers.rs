use std::cmp::Ordering;

#[derive(Debug)]
enum Class {
    Perfect,
    Abundant,
    Deficient,
}

fn aliquot_sum(n: u64) -> u64 {
    if n == 1 {
        return 0;
    }
    let mut sum = 1;
    let mut i = 2;
    while i * i <= n {
        if n % i == 0 {
            sum += i;
            if i != n / i {
                sum += n / i;
            }
        }
        i += 1;
    }
    sum
}

fn classify(n: u64) -> Class {
    match aliquot_sum(n).cmp(&n) {
        Ordering::Equal => Class::Perfect,
        Ordering::Greater => Class::Abundant,
        Ordering::Less => Class::Deficient,
    }
}

fn main() {
    for n in [6, 12, 28, 13, 33_550_336] {
        println!("{n} {:?}", classify(n));
    }
}
