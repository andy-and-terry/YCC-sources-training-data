fn parse_pair(s: &str) -> Option<(i32, i32)> {
    let Some((a, b)) = s.split_once(',') else {
        return None;
    };
    let (Ok(a), Ok(b)) = (a.trim().parse(), b.trim().parse()) else {
        return None;
    };
    Some((a, b))
}

fn main() {
    println!("{:?}", parse_pair("3, 4"));
    println!("{:?}", parse_pair("nope"));
}
