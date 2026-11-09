enum Msg {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
}

fn handle(m: Msg) -> String {
    match m {
        Msg::Quit => "quit".into(),
        Msg::Move { x, y } if x == y => "diagonal".into(),
        Msg::Move { x, y } => format!("move {x},{y}"),
        Msg::Write(s) => s,
    }
}

fn main() {
    println!("{}", handle(Msg::Move { x: 1, y: 1 }));
    println!("{}", handle(Msg::Write("hi".into())));
}
