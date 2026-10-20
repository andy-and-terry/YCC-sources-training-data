use std::any::Any;

fn describe(value: &dyn Any) -> String {
    if let Some(i) = value.downcast_ref::<i32>() {
        format!("i32 {i}")
    } else if let Some(s) = value.downcast_ref::<String>() {
        format!("string {s:?}")
    } else {
        "unknown".to_string()
    }
}

fn main() {
    let items: Vec<Box<dyn Any>> = vec![Box::new(7_i32), Box::new(String::from("hey")), Box::new(1.5_f64)];
    for it in &items {
        println!("{}", describe(it.as_ref()));
    }
    let b: Box<dyn Any> = Box::new(42_i32);
    match b.downcast::<i32>() {
        Ok(n) => println!("owned {}", *n + 1),
        Err(_) => println!("wrong type"),
    }
}
