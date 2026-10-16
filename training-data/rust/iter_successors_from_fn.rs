use std::iter;

fn main() {
    let powers: Vec<u32> = iter::successors(Some(1u32), |&x| x.checked_mul(10)).collect();
    println!("{:?}", powers);

    let collatz: Vec<u64> = iter::successors(Some(6u64), |&n| match n {
        1 => None,
        n if n % 2 == 0 => Some(n / 2),
        n => Some(3 * n + 1),
    })
    .collect();
    println!("{:?}", collatz);

    let mut state = (0u32, 1u32);
    let fibs: Vec<u32> = iter::from_fn(|| {
        let r = state.0;
        state = (state.1, state.0 + state.1);
        Some(r)
    })
    .take(10)
    .collect();
    println!("{:?}", fibs);

    let mut k = 0;
    let squares: Vec<i32> = iter::repeat_with(|| { k += 1; k * k }).take(5).collect();
    println!("{:?}", squares);
}
