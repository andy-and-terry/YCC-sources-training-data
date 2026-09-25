struct Item {
    name: &'static str,
    value: f64,
    weight: f64,
}

fn fractional_knapsack(items: &mut [Item], mut capacity: f64) -> (f64, Vec<(&'static str, f64)>) {
    items.sort_by(|a, b| (b.value / b.weight).total_cmp(&(a.value / a.weight)));
    let mut total = 0.0;
    let mut taken = Vec::new();
    for it in items.iter() {
        if capacity <= 0.0 {
            break;
        }
        let take = it.weight.min(capacity);
        total += it.value * take / it.weight;
        capacity -= take;
        taken.push((it.name, take / it.weight));
    }
    (total, taken)
}

fn main() {
    let mut items = [
        Item { name: "gold", value: 60.0, weight: 10.0 },
        Item { name: "silver", value: 100.0, weight: 20.0 },
        Item { name: "bronze", value: 120.0, weight: 30.0 },
    ];
    let (total, taken) = fractional_knapsack(&mut items, 50.0);
    println!("total {}", total);
    for (name, frac) in taken {
        println!("{}: {:.0}%", name, frac * 100.0);
    }
}
