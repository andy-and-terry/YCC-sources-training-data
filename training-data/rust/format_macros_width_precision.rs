fn main() {
    let pi = 3.14159265;
    println!("[{:8.3}] [{:<8}] [{:^8}] [{:>8}]", pi, "ab", "mid", "r");
    println!("{:#x} {:#b} {:08.2} {:+}", 255, 5, pi, 7);
    let name = "x"; let width = 6;
    println!("{name:>width$}|{0:?}", "q");
    println!("{:#?}", (1, "a"));
}
