use std::thread;

/// Odd-even transposition sort; each phase's disjoint pairs are processed in parallel
/// by splitting the slice into non-overlapping chunks.
fn odd_even_sort(a: &mut [i32]) {
    let mut sorted = false;
    while !sorted {
        sorted = true;
        for start in [1usize, 0] {
            if start >= a.len() {
                continue;
            }
            let changed = thread::scope(|s| {
                let handles: Vec<_> = a[start..]
                    .chunks_mut(2)
                    .map(|pair| {
                        s.spawn(move || {
                            if pair.len() == 2 && pair[0] > pair[1] {
                                pair.swap(0, 1);
                                true
                            } else {
                                false
                            }
                        })
                    })
                    .collect();
                handles.into_iter().map(|h| h.join().unwrap()).fold(false, |a, b| a | b)
            });
            if changed {
                sorted = false;
            }
        }
    }
}

fn main() {
    let mut v = vec![34, 2, 10, -9, 5, 3, 1, 99, -4, 0];
    odd_even_sort(&mut v);
    println!("{:?}", v);
}
