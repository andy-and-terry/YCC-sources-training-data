fn length_of_lis(nums: &[i32]) -> usize {
    let mut tails: Vec<i32> = vec![];
    for &num in nums {
        match tails.binary_search(&num) {
            Ok(_) => {}
            Err(idx) => {
                if idx == tails.len() {
                    tails.push(num);
                } else {
                    tails[idx] = num;
                }
            }
        }
    }
    tails.len()
}

fn main() {
    println!("{}", length_of_lis(&[10, 9, 2, 5, 3, 7, 101, 18]));
}
