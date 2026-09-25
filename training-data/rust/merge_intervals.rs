#[derive(Debug, Clone, Copy)]
struct Interval {
    start: i32,
    end: i32,
}

fn merge_intervals(mut intervals: Vec<Interval>) -> Vec<Interval> {
    intervals.sort_by_key(|iv| iv.start);

    intervals.into_iter().fold(Vec::new(), |mut merged, current| {
        match merged.last_mut() {
            Some(last) if current.start <= last.end => {
                last.end = last.end.max(current.end);
            }
            _ => merged.push(current),
        }
        merged
    })
}

fn main() {
    let intervals = vec![
        Interval { start: 1, end: 3 },
        Interval { start: 2, end: 6 },
        Interval { start: 8, end: 10 },
        Interval { start: 15, end: 18 },
    ];
    println!("{:?}", merge_intervals(intervals));
}
