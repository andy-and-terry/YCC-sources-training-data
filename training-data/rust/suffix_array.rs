fn build_suffix_array(s: &str) -> Vec<usize> {
    let bytes = s.as_bytes();
    let n = bytes.len();
    let mut rank: Vec<i64> = bytes.iter().map(|&b| b as i64).collect();
    let mut suffix_indices: Vec<usize> = (0..n).collect();
    let mut k = 1usize;

    loop {
        let key = |i: usize, rank: &Vec<i64>| -> (i64, i64) {
            let second = if i + k < n { rank[i + k] } else { -1 };
            (rank[i], second)
        };

        suffix_indices.sort_by_key(|&i| key(i, &rank));

        let mut new_rank = vec![0i64; n];
        for i in 1..n {
            let prev = suffix_indices[i - 1];
            let curr = suffix_indices[i];
            let bump = if key(prev, &rank) != key(curr, &rank) { 1 } else { 0 };
            new_rank[curr] = new_rank[prev] + bump;
        }
        rank = new_rank;

        if rank[*suffix_indices.last().unwrap()] as usize == n - 1 {
            break;
        }
        k *= 2;
    }
    suffix_indices
}

fn main() {
    let text = "banana";
    let sa = build_suffix_array(text);
    println!("{:?}", sa);
    let suffixes: Vec<&str> = sa.iter().map(|&i| &text[i..]).collect();
    println!("{:?}", suffixes);
}
