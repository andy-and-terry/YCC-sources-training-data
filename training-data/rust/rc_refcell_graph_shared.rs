use std::cell::RefCell;
use std::rc::Rc;

#[derive(Debug)]
struct Account {
    balance: i64,
}

fn main() {
    let shared = Rc::new(RefCell::new(Account { balance: 100 }));
    let a = Rc::clone(&shared);
    let b = Rc::clone(&shared);
    a.borrow_mut().balance -= 30;
    b.borrow_mut().balance += 5;
    println!("{:?} count={}", shared.borrow(), Rc::strong_count(&shared));
    {
        let r1 = shared.borrow();
        println!("{:?}", shared.try_borrow_mut().is_err());
        drop(r1);
    }
    println!("{:?}", shared.try_borrow_mut().is_ok());
    drop(a);
    println!("{}", Rc::strong_count(&shared));
    let cell = std::cell::Cell::new(5);
    cell.set(cell.get() * 2);
    println!("{}", cell.get());
    println!("{:?}", Rc::try_unwrap(Rc::new(1)));
}
