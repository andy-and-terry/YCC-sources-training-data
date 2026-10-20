// Drop runs in reverse declaration order when values leave scope.
struct Guard(&'static str);

impl Drop for Guard {
    fn drop(&mut self) {
        println!("drop {}", self.0);
    }
}

fn main() {
    let _a = Guard("a");
    let _b = Guard("b");
    {
        let _inner = Guard("inner");
        println!("leaving inner scope");
    }
    drop(_a);
    println!("end of main");
}
