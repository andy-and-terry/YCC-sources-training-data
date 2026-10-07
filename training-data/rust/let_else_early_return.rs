fn parse_pair(input: &str) -> Option<(i32, i32)> {
    let Some((a, b)) = input.split_once(',') else {
        return None;
    };
    let (Ok(x), Ok(y)) = (a.trim().parse::<i32>(), b.trim().parse::<i32>()) else {
        return None;
    };
    Some((x, y))
}

fn describe(v: &[i32]) -> String {
    let [first, .., last] = v else {
        return format!("too short: {:?}", v);
    };
    format!("first={} last={}", first, last)
}

enum Command {
    Move { dx: i32, dy: i32 },
    Quit,
}

fn run(cmd: Command) {
    let Command::Move { dx, dy } = cmd else {
        println!("quitting");
        return;
    };
    println!("moving by ({}, {})", dx, dy);
}

fn main() {
    println!("{:?}", parse_pair("3, 4"));
    println!("{:?}", parse_pair("3 4"));
    println!("{:?}", parse_pair("a,4"));
    println!("{}", describe(&[1, 2, 3]));
    println!("{}", describe(&[1]));
    run(Command::Move { dx: 1, dy: -2 });
    run(Command::Quit);
}
