use std::cmp::Ordering;

#[derive(Debug)]
struct Person {
    name: &'static str,
    age: u32,
}

fn main() {
    let mut people = vec![
        Person { name: "Cy", age: 30 },
        Person { name: "Al", age: 25 },
        Person { name: "Bo", age: 30 },
    ];
    people.sort_by(|a, b| b.age.cmp(&a.age).then_with(|| a.name.cmp(b.name)));
    println!("{:?}", people.iter().map(|p| p.name).collect::<Vec<_>>());

    people.sort_by_key(|p| std::cmp::Reverse(p.name));
    println!("{:?}", people.iter().map(|p| p.name).collect::<Vec<_>>());

    let mut words = vec!["banana", "Apple", "cherry"];
    words.sort_by_cached_key(|w| w.to_lowercase());
    println!("{:?}", words);

    let mut fl = vec![2.5, -1.0, 9.75];
    fl.sort_by(|a, b| a.partial_cmp(b).unwrap_or(Ordering::Equal));
    println!("{:?}", fl);
}
