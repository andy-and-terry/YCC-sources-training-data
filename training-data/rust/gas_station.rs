fn start_station(gas: &[i32], cost: &[i32]) -> Option<usize> {
    let (mut total, mut tank, mut start) = (0, 0, 0);
    for (i, (g, c)) in gas.iter().zip(cost).enumerate() {
        total += g - c;
        tank += g - c;
        if tank < 0 {
            start = i + 1;
            tank = 0;
        }
    }
    (total >= 0).then_some(start)
}

fn main() {
    println!("{:?} {:?}", start_station(&[1, 2, 3, 4, 5], &[3, 4, 5, 1, 2]), start_station(&[2, 3, 4], &[3, 4, 3]));
}
