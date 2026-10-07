fn parse_pair(s: &str) -> Option<(i32, i32)> {
    let Some((a, b)) = s.split_once(',') else {
        return None;
    };
    let Ok(a) = a.trim().parse::<i32>() else {
        return None;
    };
    let Ok(b) = b.trim().parse::<i32>() else {
        return None;
    };
    Some((a, b))
}

fn classify(n: i32) -> &'static str {
    match n {
        i32::MIN..=-1 => "negative",
        0 => "zero",
        x if x % 2 == 0 => "positive even",
        1..=9 => "small odd",
        _ => "large odd",
    }
}

fn main() {
    println!("{:?}", parse_pair("3, 4"));
    println!("{:?}", parse_pair("3;4"));
    println!("{:?}", parse_pair("a,4"));
    for n in [-5, 0, 4, 7, 11] {
        println!("{} {}", n, classify(n));
    }
    let v = Some(5);
    let msg = if let Some(x @ 1..=9) = v { format!("digit {}", x) } else { "other".to_string() };
    println!("{}", msg);
}
