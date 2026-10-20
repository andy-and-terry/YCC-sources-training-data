const fn fib(n: u32) -> u64 {
    let (mut a, mut b) = (0u64, 1u64);
    let mut i = 0;
    while i < n {
        let t = a + b;
        a = b;
        b = t;
        i += 1;
    }
    a
}

const FIB_30: u64 = fib(30);
const TABLE: [u64; 10] = {
    let mut t = [0; 10];
    let mut i = 0;
    while i < 10 {
        t[i] = fib(i as u32);
        i += 1;
    }
    t
};

const fn is_pow2(n: usize) -> bool {
    n != 0 && n & (n - 1) == 0
}

const _: () = assert!(is_pow2(64), "buffer must be a power of two");

fn main() {
    println!("{FIB_30} {:?}", TABLE);
    println!("{}", is_pow2(48));
}
