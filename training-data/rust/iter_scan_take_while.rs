// scan carries state across iterations; take_while/skip_while trim by predicate.
fn main() {
    let nums = [1, 2, 3, 4, 5];

    // Running total
    let running: Vec<i32> = nums
        .iter()
        .scan(0, |acc, &x| {
            *acc += x;
            Some(*acc)
        })
        .collect();
    println!("running sums: {:?}", running);

    // Returning None from scan ends the iteration early.
    let limited: Vec<i32> = nums
        .iter()
        .scan(1, |prod, &x| {
            *prod *= x;
            if *prod > 20 { None } else { Some(*prod) }
        })
        .collect();
    println!("running products under 20: {:?}", limited);

    let data = [1, 3, 5, 6, 7, 9];
    let odd_prefix: Vec<_> = data.iter().take_while(|&&x| x % 2 == 1).collect();
    let after: Vec<_> = data.iter().skip_while(|&&x| x % 2 == 1).collect();
    println!("{:?} / {:?}", odd_prefix, after);

    // map_while stops at the first None
    let parsed: Vec<i32> = ["1", "2", "x", "4"]
        .iter()
        .map_while(|s| s.parse().ok())
        .collect();
    println!("parsed prefix: {:?}", parsed);

    // step_by and last
    let stepped: Vec<_> = (0..20).step_by(7).collect();
    println!("{:?}, last = {:?}", stepped, stepped.last());
}
