fn precedence(op: &str) -> Option<(u8, bool)> {
    match op {
        "+" | "-" => Some((1, false)),
        "*" | "/" => Some((2, false)),
        "^" => Some((3, true)),
        _ => None,
    }
}

fn to_rpn(expr: &str) -> Vec<&str> {
    let mut out = Vec::new();
    let mut ops: Vec<&str> = Vec::new();
    for t in expr.split_whitespace() {
        if let Some((p, right)) = precedence(t) {
            while let Some(&top) = ops.last() {
                match precedence(top) {
                    Some((tp, _)) if tp > p || (tp == p && !right) => out.push(ops.pop().unwrap()),
                    _ => break,
                }
            }
            ops.push(t);
        } else if t == "(" {
            ops.push(t);
        } else if t == ")" {
            while let Some(top) = ops.pop() {
                if top == "(" {
                    break;
                }
                out.push(top);
            }
        } else {
            out.push(t);
        }
    }
    out.extend(ops.into_iter().rev());
    out
}

fn eval_rpn(rpn: &[&str]) -> Option<f64> {
    let mut st: Vec<f64> = Vec::new();
    for &t in rpn {
        if precedence(t).is_some() {
            let b = st.pop()?;
            let a = st.pop()?;
            st.push(match t {
                "+" => a + b,
                "-" => a - b,
                "*" => a * b,
                "/" => a / b,
                _ => a.powf(b),
            });
        } else {
            st.push(t.parse().ok()?);
        }
    }
    st.pop()
}

fn main() {
    let rpn = to_rpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3");
    println!("{} = {:?}", rpn.join(" "), eval_rpn(&rpn));
}
