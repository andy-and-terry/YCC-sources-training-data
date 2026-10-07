type Mat = [[u128; 2]; 2];

fn mul(a: &Mat, b: &Mat) -> Mat {
    let mut r = [[0u128; 2]; 2];
    for i in 0..2 {
        for j in 0..2 {
            for k in 0..2 {
                r[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    r
}

fn fib(mut n: u32) -> u128 {
    let mut result: Mat = [[1, 0], [0, 1]];
    let mut base: Mat = [[1, 1], [1, 0]];
    while n > 0 {
        if n & 1 == 1 {
            result = mul(&result, &base);
        }
        base = mul(&base, &base);
        n >>= 1;
    }
    result[0][1]
}

fn main() {
    let first: Vec<u128> = (0..11).map(fib).collect();
    println!("{:?}", first);
    println!("{}", fib(100));
}
