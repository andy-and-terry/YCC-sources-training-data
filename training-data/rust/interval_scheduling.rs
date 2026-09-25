#[derive(Debug, Clone, Copy)]
struct Interval {
    start: u32,
    end: u32,
}

fn max_non_overlapping(mut iv: Vec<Interval>) -> Vec<Interval> {
    iv.sort_by_key(|i| i.end);
    let mut end = 0;
    iv.into_iter()
        .filter(|i| {
            let keep = i.start >= end;
            if keep {
                end = i.end;
            }
            keep
        })
        .collect()
}

fn min_rooms(iv: &[Interval]) -> usize {
    let mut events: Vec<(u32, i32)> = iv.iter().flat_map(|i| [(i.start, 1), (i.end, -1)]).collect();
    events.sort();
    events.iter().scan(0i32, |cur, &(_, d)| { *cur += d; Some(*cur) }).max().unwrap_or(0) as usize
}

fn main() {
    let m: Vec<Interval> = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]
        .iter()
        .map(|&(start, end)| Interval { start, end })
        .collect();
    println!("rooms: {}", min_rooms(&m));
    for i in max_non_overlapping(m) {
        print!("[{},{}) ", i.start, i.end);
    }
    println!();
}
