// Option combinators avoid nested match expressions.
#[derive(Debug)]
struct User {
    name: String,
    email: Option<String>,
    age: Option<u32>,
}

fn domain(user: &User) -> Option<&str> {
    user.email.as_deref()?.split('@').nth(1)
}

fn main() {
    let u = User { name: "Ann".into(), email: Some("ann@example.com".into()), age: Some(30) };
    let v = User { name: "Bob".into(), email: None, age: None };

    println!("{:?} {:?}", domain(&u), domain(&v));
    println!("{}", v.age.map_or("unknown".to_string(), |a| a.to_string()));
    println!("{}", u.age.map(|a| a + 1).unwrap_or_default());
    println!("{:?}", u.age.filter(|&a| a > 40));
    println!("{:?}", v.email.clone().or_else(|| Some("none@local".into())));
    println!("{:?}", u.email.as_ref().zip(u.age));
    println!("{:?}", u.age.and_then(|a| a.checked_sub(50)));
    println!("{:?}", v.age.ok_or("age missing"));
    println!("{}", u.name.chars().next().is_some_and(|c| c.is_uppercase()));

    let mut slot = Some(3);
    let taken = slot.take();
    println!("{:?} {:?}", taken, slot);
    let got = slot.get_or_insert(10);
    *got += 1;
    println!("{:?}", slot);
    println!("{:?}", Some(Some(1)).flatten());
    let total: Option<u32> = [Some(1), Some(2), None].into_iter().sum();
    println!("{:?}", total);
}
