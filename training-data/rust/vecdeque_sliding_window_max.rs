use std::collections::VecDeque;

fn window_max(v: &[i32], k: usize) -> Vec<i32> {
    let mut dq: VecDeque<usize> = VecDeque::new();
    let mut out = vec![];
    for i in 0..v.len() {
        while dq.back().map_or(false, |&j| v[j] <= v[i]) { dq.pop_back(); }
        dq.push_back(i);
        if dq[0] + k <= i { dq.pop_front(); }
        if i + 1 >= k { out.push(v[dq[0]]); }
    }
    out
}

fn main() { println!("{:?}", window_max(&[1, 3, -1, -3, 5, 3, 6, 7], 3)); }
