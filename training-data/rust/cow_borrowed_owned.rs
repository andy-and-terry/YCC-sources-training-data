use std::borrow::Cow;

fn normalize(input: &str) -> Cow<str> {
    if input.contains(' ') {
        Cow::Owned(input.replace(' ', "_"))
    } else {
        Cow::Borrowed(input)
    }
}

fn abs_all(v: &mut Cow<[i32]>) {
    for i in 0..v.len() {
        if v[i] < 0 {
            v.to_mut()[i] = -v[i]; // clones only on first write
        }
    }
}

fn main() {
    for s in ["no_spaces", "has some spaces"] {
        let r = normalize(s);
        println!("{} {}", r, matches!(r, Cow::Borrowed(_)));
    }
    let data = [1, 2, 3];
    let mut c = Cow::Borrowed(&data[..]);
    abs_all(&mut c);
    println!("{:?} borrowed={}", c, matches!(c, Cow::Borrowed(_)));
    let neg = [1, -2];
    let mut c2 = Cow::Borrowed(&neg[..]);
    abs_all(&mut c2);
    println!("{:?} borrowed={}", c2, matches!(c2, Cow::Borrowed(_)));
}
