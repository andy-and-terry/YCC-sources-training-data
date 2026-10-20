fn parse_pair(s: &str) -> Option<(i32, i32)> {
    let Some((a, b)) = s.split_once(',') else {
        return None;
    };
    let (Ok(a), Ok(b)) = (a.trim().parse::<i32>(), b.trim().parse::<i32>()) else {
        return None;
    };
    Some((a, b))
}

fn first_even(xs: &[i32]) -> &'static str {
    let Some(x) = xs.iter().find(|x| *x % 2 == 0) else {
        return "none";
    };
    if *x > 10 { "big even" } else { "small even" }
}

fn main() {
    println!("{:?} {:?} {:?}", parse_pair("3, 4"), parse_pair("3;4"), parse_pair("x,1"));
    println!("{} {} {}", first_even(&[1, 3]), first_even(&[1, 4]), first_even(&[12]));
}
