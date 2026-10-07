#[derive(Debug, Clone)]
struct Employee {
    name: &'static str,
    dept: &'static str,
    salary: u32,
}

fn main() {
    let mut staff = vec![
        Employee { name: "Ann", dept: "eng", salary: 120 },
        Employee { name: "Bob", dept: "ops", salary: 90 },
        Employee { name: "Cy", dept: "eng", salary: 100 },
        Employee { name: "Di", dept: "ops", salary: 90 },
    ];

    staff.sort_by_key(|e| (e.dept, std::cmp::Reverse(e.salary)));
    for e in &staff {
        println!("{:<4}{:<4}{}", e.name, e.dept, e.salary);
    }

    let mut depts: Vec<_> = staff.iter().map(|e| e.dept).collect();
    depts.dedup();
    println!("{:?}", depts);

    staff.retain(|e| e.salary >= 100);
    println!("{:?}", staff.iter().map(|e| e.name).collect::<Vec<_>>());

    let mut nums = vec![3.2, 1.5, 2.8];
    nums.sort_by(|a, b| a.partial_cmp(b).unwrap());
    println!("{:?}", nums);
    println!("{:?}", nums.binary_search_by(|x| x.partial_cmp(&2.8).unwrap()));
}
