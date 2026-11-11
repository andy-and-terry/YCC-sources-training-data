// Perrin sequence P(n)=P(n-2)+P(n-3)
fn main() {
    let mut v: Vec<u64> = vec![3, 0, 2];
    for i in 3..10 {
        let next = v[i - 2] + v[i - 3];
        v.push(next);
    }
    println!("{:?}", v);
}
