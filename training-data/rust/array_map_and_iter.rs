fn main() {
    let a = [1, 2, 3, 4];
    let b = a.map(|x| x * x);
    println!("{:?}", b);

    let names: [String; 3] = std::array::from_fn(|i| format!("item{}", i));
    println!("{:?}", names);

    let grid = [[0u8; 3]; 2];
    println!("{:?} len={}", grid, grid.len() * grid[0].len());

    let [first, .., last] = a;
    println!("{} {}", first, last);

    let total: i32 = a.iter().sum();
    println!("{} contains 3? {}", total, a.contains(&3));
    let v: Vec<i32> = a.into();
    println!("{:?}", v);
}
