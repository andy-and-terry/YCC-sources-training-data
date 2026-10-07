fn merge_sort(mut values: Vec<i32>) -> Vec<i32> {
    let len = values.len();
    if len <= 1 {
        return values;
    }
    let right = values.split_off(len / 2);
    let left = merge_sort(values);
    let right = merge_sort(right);
    merge(left, right)
}

fn merge(left: Vec<i32>, right: Vec<i32>) -> Vec<i32> {
    let mut result = Vec::with_capacity(left.len() + right.len());
    let mut left = left.into_iter().peekable();
    let mut right = right.into_iter().peekable();

    loop {
        match (left.peek(), right.peek()) {
            (Some(&l), Some(&r)) => {
                if l <= r {
                    result.push(left.next().unwrap());
                } else {
                    result.push(right.next().unwrap());
                }
            }
            (Some(_), None) => result.push(left.next().unwrap()),
            (None, Some(_)) => result.push(right.next().unwrap()),
            (None, None) => break,
        }
    }
    result
}

fn main() {
    let data = vec![9, 3, 7, 1, 8, 2, 5, 4, 6];
    println!("{:?}", merge_sort(data));
}
