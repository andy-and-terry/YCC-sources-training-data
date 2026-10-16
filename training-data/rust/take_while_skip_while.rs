fn main() {
    let v = [1, 3, 5, 6, 7, 9, 10];
    let odds: Vec<_> = v.iter().take_while(|&&x| x % 2 == 1).collect();
    println!("leading odds: {:?}", odds);

    let rest: Vec<_> = v.iter().skip_while(|&&x| x % 2 == 1).collect();
    println!("after leading odds: {:?}", rest);

    let firsts: Vec<_> = v.iter().map_while(|&x| if x < 7 { Some(x * 10) } else { None }).collect();
    println!("map_while: {:?}", firsts);

    let pos = v.iter().position(|&x| x == 7);
    println!("position of 7: {:?}", pos);
}
