// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
fn max_depth(s: &str) -> i32 {
    let (mut depth, mut best) = (0, 0);
    for ch in s.chars() {
        match ch {
            '(' => {
                depth += 1;
                best = best.max(depth);
            }
            ')' => {
                depth -= 1;
                if depth < 0 {
                    return -1;
                }
            }
            _ => {}
        }
    }
    if depth == 0 { best } else { -1 }
}

fn main() {
    println!("{} {}", max_depth("(1+(2*(3)))"), max_depth("(()"));
}
