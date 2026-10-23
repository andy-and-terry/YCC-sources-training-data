use std::any::Any;

trait Component: Any {
    fn name(&self) -> String;
    fn as_any(&self) -> &dyn Any;
}

struct Position(i32, i32);
struct Health(u32);

impl Component for Position {
    fn name(&self) -> String {
        "position".to_string()
    }
    fn as_any(&self) -> &dyn Any {
        self
    }
}

impl Component for Health {
    fn name(&self) -> String {
        "health".to_string()
    }
    fn as_any(&self) -> &dyn Any {
        self
    }
}

fn describe(value: &dyn Any) -> String {
    if let Some(n) = value.downcast_ref::<i32>() {
        format!("i32 {}", n)
    } else if let Some(s) = value.downcast_ref::<String>() {
        format!("String {:?}", s)
    } else {
        "unknown type".to_string()
    }
}

fn main() {
    println!("{}", describe(&42i32));
    println!("{}", describe(&String::from("hi")));
    println!("{}", describe(&3.5f64));

    let components: Vec<Box<dyn Component>> =
        vec![Box::new(Position(3, 4)), Box::new(Health(90))];

    for c in &components {
        if let Some(p) = c.as_any().downcast_ref::<Position>() {
            println!("{} at ({}, {})", c.name(), p.0, p.1);
        } else if let Some(h) = c.as_any().downcast_ref::<Health>() {
            println!("{} = {}", c.name(), h.0);
        }
    }

    let boxed: Box<dyn Any> = Box::new(7u8);
    match boxed.downcast::<u8>() {
        Ok(v) => println!("owned u8: {}", v),
        Err(_) => println!("not a u8"),
    }
}
