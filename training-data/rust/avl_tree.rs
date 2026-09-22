type Link = Option<Box<Node>>;

struct Node {
    key: i32,
    height: i32,
    left: Link,
    right: Link,
}

fn height(node: &Link) -> i32 {
    node.as_ref().map_or(0, |n| n.height)
}

fn update_height(node: &mut Node) {
    node.height = 1 + height(&node.left).max(height(&node.right));
}

fn balance_factor(node: &Node) -> i32 {
    height(&node.left) - height(&node.right)
}

fn rotate_right(mut y: Box<Node>) -> Box<Node> {
    let mut x = y.left.take().unwrap();
    y.left = x.right.take();
    update_height(&mut y);
    x.right = Some(y);
    update_height(&mut x);
    x
}

fn rotate_left(mut x: Box<Node>) -> Box<Node> {
    let mut y = x.right.take().unwrap();
    x.right = y.left.take();
    update_height(&mut x);
    y.left = Some(x);
    update_height(&mut y);
    y
}

fn insert(node: Link, key: i32) -> Link {
    let mut node = match node {
        None => {
            return Some(Box::new(Node {
                key,
                height: 1,
                left: None,
                right: None,
            }))
        }
        Some(n) => n,
    };

    if key < node.key {
        node.left = insert(node.left.take(), key);
    } else if key > node.key {
        node.right = insert(node.right.take(), key);
    } else {
        return Some(node);
    }

    update_height(&mut node);
    let balance = balance_factor(&node);

    if balance > 1 && key < node.left.as_ref().unwrap().key {
        return Some(rotate_right(node));
    }
    if balance < -1 && key > node.right.as_ref().unwrap().key {
        return Some(rotate_left(node));
    }
    if balance > 1 && key > node.left.as_ref().unwrap().key {
        let left = node.left.take().unwrap();
        node.left = Some(rotate_left(left));
        return Some(rotate_right(node));
    }
    if balance < -1 && key < node.right.as_ref().unwrap().key {
        let right = node.right.take().unwrap();
        node.right = Some(rotate_right(right));
        return Some(rotate_left(node));
    }

    Some(node)
}

fn inorder(node: &Link, out: &mut Vec<i32>) {
    if let Some(n) = node {
        inorder(&n.left, out);
        out.push(n.key);
        inorder(&n.right, out);
    }
}

fn main() {
    let mut root: Link = None;
    for value in [10, 20, 30, 40, 50, 25] {
        root = insert(root, value);
    }
    let mut result = Vec::new();
    inorder(&root, &mut result);
    println!("{:?}", result);
    println!("height={}", height(&root));
}
