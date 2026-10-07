use std::cmp::Ordering;

#[derive(Debug, Eq, PartialEq, Clone)]
struct Task {
    priority: u8,
    name: String,
}

impl Ord for Task {
    fn cmp(&self, other: &Self) -> Ordering {
        // Higher priority first; ties broken alphabetically by name.
        other.priority.cmp(&self.priority).then_with(|| self.name.cmp(&other.name))
    }
}

impl PartialOrd for Task {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn main() {
    let mut tasks = vec![
        Task { priority: 2, name: "cleanup".to_string() },
        Task { priority: 5, name: "deploy".to_string() },
        Task { priority: 5, name: "backup".to_string() },
        Task { priority: 1, name: "log".to_string() },
    ];

    tasks.sort();
    for task in &tasks {
        println!("{:?}", task);
    }

    let highest = tasks.iter().max_by_key(|t| t.priority).unwrap();
    println!("highest priority: {:?}", highest);
}
