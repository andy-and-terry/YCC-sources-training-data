use std::process::{Command, Stdio};
use std::io::Write;

fn main() {
    let out = Command::new("echo").arg("hello").output().expect("spawn echo");
    println!("{:?} {}", String::from_utf8_lossy(&out.stdout).trim(), out.status.success());

    let mut child = Command::new("tr")
        .args(["a-z", "A-Z"])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
        .expect("spawn tr");
    child.stdin.take().unwrap().write_all(b"shout").unwrap();
    let result = child.wait_with_output().unwrap();
    println!("{}", String::from_utf8_lossy(&result.stdout));

    let status = Command::new("sh").args(["-c", "exit 3"]).status().unwrap();
    println!("{:?}", status.code());
}
