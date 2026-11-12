use std::fmt::Debug;

fn show_all<I, T>(it: I) -> String
where
    I: IntoIterator<Item = T>,
    T: Debug,
{
    it.into_iter().map(|x| format!("{:?}", x)).collect::<Vec<_>>().join("|")
}

fn main() {
    println!("{}", show_all(vec![1, 2, 3]));
    println!("{}", show_all(["a", "b"]));
}
