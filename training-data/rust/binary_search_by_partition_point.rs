fn main() {
    let v = [1, 3, 5, 7, 9, 11];
    println!("{:?} {:?}", v.binary_search(&7), v.binary_search(&4));
    let idx = v.partition_point(|&x| x < 6);
    println!("{}", idx);
    println!("{:?}", v.binary_search_by_key(&22, |&x| x * 2));
}
