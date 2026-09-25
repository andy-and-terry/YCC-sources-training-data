#[derive(Debug, Clone, Copy)]
struct Activity {
    start: i32,
    finish: i32,
}

// Greedy strategy: always take the next activity that finishes earliest
// among those compatible with what has already been selected.
fn select_activities(mut activities: Vec<Activity>) -> Vec<Activity> {
    activities.sort_by_key(|a| a.finish);

    let mut selected = Vec::new();
    let mut last_finish = i32::MIN;
    for activity in activities {
        if activity.start >= last_finish {
            last_finish = activity.finish;
            selected.push(activity);
        }
    }
    selected
}

fn main() {
    let activities = vec![
        Activity { start: 1, finish: 4 },
        Activity { start: 3, finish: 5 },
        Activity { start: 0, finish: 6 },
        Activity { start: 5, finish: 7 },
        Activity { start: 3, finish: 9 },
        Activity { start: 5, finish: 9 },
        Activity { start: 6, finish: 10 },
        Activity { start: 8, finish: 11 },
        Activity { start: 8, finish: 12 },
        Activity { start: 2, finish: 14 },
        Activity { start: 12, finish: 16 },
    ];
    println!("{:?}", select_activities(activities));
}
