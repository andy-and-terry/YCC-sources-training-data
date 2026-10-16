fn main() {
    let line = "key=value=more";
    println!("{:?}", line.split('=').collect::<Vec<_>>());
    println!("{:?}", line.splitn(2, '=').collect::<Vec<_>>());
    println!("{:?}", line.split_once('='));
    println!("{:?}", line.rsplit_once('='));

    let csv = "a,b,,c,";
    println!("{:?}", csv.split(',').collect::<Vec<_>>());
    println!("{:?}", csv.split_terminator(',').collect::<Vec<_>>());

    let text = "  one\ttwo\n three  ";
    println!("{:?}", text.split_whitespace().collect::<Vec<_>>());
    println!("{:?}", "a1b22c".split(|c: char| c.is_ascii_digit()).collect::<Vec<_>>());
    println!("{:?}", "line1\nline2\r\nline3".lines().collect::<Vec<_>>());
}
