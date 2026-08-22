use std::sync::OnceLock;

struct Singleton {
    value: i32,
}

static INSTANCE: OnceLock<Singleton> = OnceLock::new();

fn get_instance(value: i32) -> &'static Singleton {
    INSTANCE.get_or_init(|| Singleton { value })
}

fn main() {
    let a = get_instance(1);
    let b = get_instance(2);
    println!("{} {}", a.value, b.value);
}
