fn permutations(items: &[i32]) -> Vec<Vec<i32>> {
    if items.len() <= 1 {
        return vec![items.to_vec()];
    }
    let mut result = vec![];
    for i in 0..items.len() {
        let mut rest = items.to_vec();
        let chosen = rest.remove(i);
        for mut perm in permutations(&rest) {
            perm.insert(0, chosen);
            result.push(perm);
        }
    }
    result
}

fn main() {
    println!("{:?}", permutations(&[1, 2, 3]));
}
