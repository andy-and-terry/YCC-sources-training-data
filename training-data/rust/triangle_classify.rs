#[derive(Debug, PartialEq)]
enum Triangle {
    Equilateral,
    Isosceles,
    Scalene,
}

fn classify(sides: [f64; 3]) -> Option<Triangle> {
    let mut s = sides;
    s.sort_by(|a, b| a.partial_cmp(b).unwrap());
    if s[0] <= 0.0 || s[0] + s[1] <= s[2] {
        return None;
    }
    Some(if s[0] == s[2] {
        Triangle::Equilateral
    } else if s[0] == s[1] || s[1] == s[2] {
        Triangle::Isosceles
    } else {
        Triangle::Scalene
    })
}

fn main() {
    for t in [[3.0, 3.0, 3.0], [3.0, 4.0, 4.0], [3.0, 4.0, 5.0], [1.0, 1.0, 3.0]] {
        println!("{:?} {:?}", t, classify(t));
    }
}
