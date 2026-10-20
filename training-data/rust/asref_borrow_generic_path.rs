use std::path::Path;

fn ext<P: AsRef<Path>>(p: P) -> Option<String> {
    p.as_ref().extension().map(|e| e.to_string_lossy().into_owned())
}

fn shout<S: AsRef<str>>(s: S) -> String { s.as_ref().to_uppercase() }

fn main() {
    println!("{:?} {:?}", ext("a/b.txt"), ext(String::from("noext")));
    println!("{} {}", shout("hi"), shout(String::from("yo")));
}
