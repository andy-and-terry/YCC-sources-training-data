#[derive(Debug, Clone)]
struct Person {
    name: &'static str,
    age: u32,
}

fn main() {
    let mut people = vec![
        Person { name: "Cy", age: 30 },
        Person { name: "Ann", age: 25 },
        Person { name: "Bob", age: 30 },
        Person { name: "Dee", age: 25 },
    ];

    people.sort_by_key(|p| p.age);
    println!("{:?}", people.iter().map(|p| p.name).collect::<Vec<_>>());

    people.sort_by(|a, b| b.age.cmp(&a.age).then_with(|| a.name.cmp(b.name)));
    println!("{:?}", people.iter().map(|p| p.name).collect::<Vec<_>>());

    let mut ages: Vec<u32> = people.iter().map(|p| p.age).collect();
    ages.dedup();
    println!("{:?}", ages);

    let mut nums = vec![5, 3, 5, 1, 3, 9, 1];
    nums.sort_unstable();
    nums.dedup();
    println!("{:?}", nums);

    nums.retain(|&n| n != 3);
    println!("{:?}", nums);

    let mut floats = vec![2.5, -1.0, 9.75, 0.0];
    floats.sort_by(|a, b| a.partial_cmp(b).unwrap());
    println!("{:?}", floats);

    let mut words = vec!["banana", "Apple", "cherry"];
    words.sort_by_cached_key(|w| w.to_lowercase());
    println!("{:?}", words);

    let pos = nums.binary_search(&5);
    println!("{:?} {:?}", pos, nums.binary_search(&4));
    let drained: Vec<_> = nums.drain(..2).collect();
    println!("{:?} {:?}", drained, nums);
}
