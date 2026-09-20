fn radix_sort(items: &[u32]) -> Vec<u32> {
    if items.is_empty() {
        return Vec::new();
    }
    let mut output = items.to_vec();
    let max_value = *output.iter().max().unwrap();

    let mut exp = 1u32;
    while max_value / exp > 0 {
        output = counting_sort_by_digit(&output, exp);
        exp *= 10;
    }
    output
}

fn counting_sort_by_digit(items: &[u32], exp: u32) -> Vec<u32> {
    let mut output = vec![0u32; items.len()];
    let mut count = [0usize; 10];

    for &item in items {
        let digit = ((item / exp) % 10) as usize;
        count[digit] += 1;
    }
    for i in 1..10 {
        count[i] += count[i - 1];
    }
    for &item in items.iter().rev() {
        let digit = ((item / exp) % 10) as usize;
        count[digit] -= 1;
        output[count[digit]] = item;
    }
    output
}

fn main() {
    let data = vec![170, 45, 75, 90, 802, 24, 2, 66];
    println!("{:?}", radix_sort(&data));
}
