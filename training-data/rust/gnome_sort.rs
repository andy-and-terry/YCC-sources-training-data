fn gnome_sort_by<T, F: Fn(&T, &T) -> bool>(a: &mut [T], less: F) {
    let mut i = 0;
    while i < a.len() {
        if i == 0 || !less(&a[i], &a[i - 1]) {
            i += 1;
        } else {
            a.swap(i, i - 1);
            i -= 1;
        }
    }
}

fn main() {
    let mut nums = vec![34, 2, 10, -9, 7];
    gnome_sort_by(&mut nums, |a, b| a < b);
    println!("{:?}", nums);
    let mut words = vec!["Delta", "alpha", "Charlie", "bravo"];
    gnome_sort_by(&mut words, |a, b| a.to_lowercase() < b.to_lowercase());
    println!("{:?}", words);
}
