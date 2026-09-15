type Link = Option<Box<Node>>;

struct Node {
    value: i32,
    left: Link,
    right: Link,
    height: i32,
}

impl Node {
    fn new(value: i32) -> Box<Node> {
        Box::new(Node { value, left: None, right: None, height: 1 })
    }
}

fn height(node: &Link) -> i32 {
    node.as_ref().map_or(0, |n| n.height)
}

fn update_height(node: &mut Box<Node>) {
    node.height = 1 + height(&node.left).max(height(&node.right));
}

fn balance_factor(node: &Box<Node>) -> i32 {
    height(&node.left) - height(&node.right)
}

fn rotate_right(mut node: Box<Node>) -> Box<Node> {
    let mut new_root = node.left.take().unwrap();
    node.left = new_root.right.take();
    update_height(&mut node);
    new_root.right = Some(node);
    update_height(&mut new_root);
    new_root
}

fn rotate_left(mut node: Box<Node>) -> Box<Node> {
    let mut new_root = node.right.take().unwrap();
    node.right = new_root.left.take();
    update_height(&mut node);
    new_root.left = Some(node);
    update_height(&mut new_root);
    new_root
}

fn rebalance(mut node: Box<Node>) -> Box<Node> {
    update_height(&mut node);
    let bf = balance_factor(&node);

    if bf > 1 {
        if balance_factor(node.left.as_ref().unwrap()) < 0 {
            let left = node.left.take().unwrap();
            node.left = Some(rotate_left(left));
        }
        rotate_right(node)
    } else if bf < -1 {
        if balance_factor(node.right.as_ref().unwrap()) > 0 {
            let right = node.right.take().unwrap();
            node.right = Some(rotate_right(right));
        }
        rotate_left(node)
    } else {
        node
    }
}

fn insert(node: Link, value: i32) -> Link {
    match node {
        None => Some(Node::new(value)),
        Some(mut n) => {
            if value < n.value {
                n.left = insert(n.left.take(), value);
            } else if value > n.value {
                n.right = insert(n.right.take(), value);
            } else {
                return Some(n);
            }
            Some(rebalance(n))
        }
    }
}

fn inorder(node: &Link, out: &mut Vec<i32>) {
    if let Some(n) = node {
        inorder(&n.left, out);
        out.push(n.value);
        inorder(&n.right, out);
    }
}

fn main() {
    let mut root: Link = None;
    for v in [10, 20, 30, 40, 50, 25] {
        root = insert(root, v);
    }

    let mut values = Vec::new();
    inorder(&root, &mut values);
    println!("{:?}", values);
    println!("height: {}", height(&root));
}
