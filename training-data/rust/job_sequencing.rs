struct Job {
    id: char,
    deadline: usize,
    profit: u32,
}

fn find(parent: &mut [usize], x: usize) -> usize {
    if parent[x] != x {
        parent[x] = find(parent, parent[x]);
    }
    parent[x]
}

fn schedule(mut jobs: Vec<Job>) -> (Vec<char>, u32) {
    jobs.sort_by(|a, b| b.profit.cmp(&a.profit));
    let max_d = jobs.iter().map(|j| j.deadline).max().unwrap_or(0);
    let mut parent: Vec<usize> = (0..=max_d).collect();
    let mut slots = vec![None; max_d + 1];
    for j in &jobs {
        let free = find(&mut parent, j.deadline);
        if free > 0 {
            slots[free] = Some((j.id, j.profit));
            parent[free] = free - 1;
        }
    }
    let chosen: Vec<(char, u32)> = slots.into_iter().flatten().collect();
    (chosen.iter().map(|c| c.0).collect(), chosen.iter().map(|c| c.1).sum())
}

fn main() {
    let jobs = vec![
        Job { id: 'a', deadline: 2, profit: 100 },
        Job { id: 'b', deadline: 1, profit: 19 },
        Job { id: 'c', deadline: 2, profit: 27 },
        Job { id: 'd', deadline: 1, profit: 25 },
        Job { id: 'e', deadline: 3, profit: 15 },
    ];
    println!("{:?}", schedule(jobs));
}
