fn cocktail_shaker_sort<T: PartialOrd>(a: &mut [T]) {
    if a.len() < 2 {
        return;
    }
    let (mut lo, mut hi) = (0, a.len() - 1);
    let mut swapped = true;
    while swapped {
        swapped = false;
        for i in lo..hi {
            if a[i] > a[i + 1] {
                a.swap(i, i + 1);
                swapped = true;
            }
        }
        hi -= 1;
        for i in (lo + 1..=hi).rev() {
            if a[i - 1] > a[i] {
                a.swap(i - 1, i);
                swapped = true;
            }
        }
        lo += 1;
    }
}

fn main() {
    let mut v = vec![5, 1, 4, 2, 8, 0, 2];
    cocktail_shaker_sort(&mut v);
    println!("{:?}", v);
    let mut words = vec!["pear", "apple", "fig"];
    cocktail_shaker_sort(&mut words);
    println!("{:?}", words);
}
