fn hanoi(n: u32, source: char, target: char, auxiliary: char, moves: &mut Vec<(char, char)>) {
    if n == 1 {
        moves.push((source, target));
        return;
    }
    hanoi(n - 1, source, auxiliary, target, moves);
    moves.push((source, target));
    hanoi(n - 1, auxiliary, target, source, moves);
}

fn main() {
    let mut moves = vec![];
    hanoi(3, 'A', 'C', 'B', &mut moves);
    for (s, t) in moves {
        println!("{} -> {}", s, t);
    }
}
