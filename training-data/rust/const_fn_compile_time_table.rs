const fn square(n: usize) -> usize { n * n }

const TABLE: [usize; 5] = {
    let mut t = [0; 5];
    let mut i = 0;
    while i < 5 { t[i] = square(i); i += 1; }
    t
};

fn main() {
    println!("{:?}", TABLE);
}
