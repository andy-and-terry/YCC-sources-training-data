struct SortContext {
    strategy: Box<dyn Fn(&[i32]) -> Vec<i32>>,
}

impl SortContext {
    fn sort(&self, items: &[i32]) -> Vec<i32> {
        (self.strategy)(items)
    }
}

fn ascending(items: &[i32]) -> Vec<i32> {
    let mut v = items.to_vec();
    v.sort();
    v
}

fn descending(items: &[i32]) -> Vec<i32> {
    let mut v = ascending(items);
    v.reverse();
    v
}

fn main() {
    let mut ctx = SortContext { strategy: Box::new(ascending) };
    println!("{:?}", ctx.sort(&[5, 3, 8, 1]));
    ctx.strategy = Box::new(descending);
    println!("{:?}", ctx.sort(&[5, 3, 8, 1]));
}
