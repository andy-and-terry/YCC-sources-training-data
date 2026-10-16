use std::rc::Rc;

struct Config {
    name: String,
}

struct Service {
    cfg: Rc<Config>,
    id: u32,
}

fn main() {
    let cfg = Rc::new(Config { name: "prod".to_string() });
    println!("count after create: {}", Rc::strong_count(&cfg));

    let s1 = Service { cfg: Rc::clone(&cfg), id: 1 };
    let s2 = Service { cfg: Rc::clone(&cfg), id: 2 };
    println!("count with two services: {}", Rc::strong_count(&cfg));

    println!("{} uses {}, {} uses {}", s1.id, s1.cfg.name, s2.id, s2.cfg.name);
    drop(s1);
    println!("after drop: {}", Rc::strong_count(&cfg));
    println!("ptr_eq: {}", Rc::ptr_eq(&cfg, &s2.cfg));
    match Rc::try_unwrap(cfg) {
        Ok(_) => println!("unique"),
        Err(rc) => println!("still shared ({})", Rc::strong_count(&rc)),
    }
}
