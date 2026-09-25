#[derive(Debug)]
struct Node {
    val: i32,
    next: Option<Box<Node>>,
}

fn from_vec(v: &[i32]) -> Option<Box<Node>> {
    v.iter().rev().fold(None, |next, &val| Some(Box::new(Node { val, next })))
}

fn to_vec(mut l: &Option<Box<Node>>) -> Vec<i32> {
    let mut out = Vec::new();
    while let Some(n) = l {
        out.push(n.val);
        l = &n.next;
    }
    out
}

fn merge(a: Option<Box<Node>>, b: Option<Box<Node>>) -> Option<Box<Node>> {
    match (a, b) {
        (None, r) | (r, None) => r,
        (Some(mut x), Some(mut y)) => {
            if x.val <= y.val {
                x.next = merge(x.next.take(), Some(y));
                Some(x)
            } else {
                y.next = merge(Some(x), y.next.take());
                Some(y)
            }
        }
    }
}

fn main() {
    let m = merge(from_vec(&[1, 2, 4, 9]), from_vec(&[1, 3, 4, 5, 10]));
    println!("{:?}", to_vec(&m));
}
