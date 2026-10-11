#[derive(Debug)]
struct Emp {
    name: &'static str,
    salary: u32,
    age: u8,
}

fn main() {
    let staff = vec![
        Emp { name: "Ivy", salary: 5200, age: 41 },
        Emp { name: "Joe", salary: 4100, age: 29 },
        Emp { name: "Kim", salary: 6100, age: 35 },
    ];
    let richest = staff.iter().max_by_key(|e| e.salary).unwrap();
    let youngest = staff.iter().min_by_key(|e| e.age).unwrap();
    println!("{} {}", richest.name, youngest.name);

    let temps = [21.5, 19.0, 25.25, 22.0];
    let hot = temps.iter().cloned().max_by(|a, b| a.partial_cmp(b).unwrap());
    println!("{:?}", hot);

    let total: u32 = staff.iter().map(|e| e.salary).sum();
    let prod: u64 = (1..=5u64).product();
    println!("{} {}", total, prod);
    println!("{:?}", staff.iter().rev().last().map(|e| e.name));
}
