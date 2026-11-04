fn is_toeplitz(m: &[Vec<i32>]) -> bool {
    m.windows(2).all(|w| {
        w[1].iter().skip(1).zip(w[0].iter()).all(|(a, b)| a == b)
    })
}

fn main() {
    println!("{}", is_toeplitz(&[vec![1, 2, 3], vec![4, 1, 2], vec![5, 4, 1]]));
    println!("{}", is_toeplitz(&[vec![1, 2], vec![2, 2]]));
}
