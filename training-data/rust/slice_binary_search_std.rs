fn main() {
    let v = [1, 3, 5, 7, 9, 11];
    println!("{:?}", v.binary_search(&7));
    println!("{:?}", v.binary_search(&4));

    match v.binary_search(&10) {
        Ok(i) => println!("found at {}", i),
        Err(i) => println!("insert at {}", i),
    }

    let idx = v.partition_point(|&x| x < 6);
    println!("partition_point(<6) = {}", idx);

    let mut sorted = vec![10, 20, 30];
    let pos = sorted.binary_search(&25).unwrap_or_else(|e| e);
    sorted.insert(pos, 25);
    println!("{:?}", sorted);

    let people = [("al", 20), ("bo", 30), ("cy", 40)];
    println!("{:?}", people.binary_search_by_key(&30, |&(_, age)| age));
}
