use std::ops::{Add, AddAssign, Index, IndexMut, Mul, Neg, Sub};

#[derive(Debug, Clone, Copy, PartialEq)]
struct V2 {
    x: f64,
    y: f64,
}

impl Add for V2 {
    type Output = V2;
    fn add(self, o: V2) -> V2 { V2 { x: self.x + o.x, y: self.y + o.y } }
}
impl Sub for V2 {
    type Output = V2;
    fn sub(self, o: V2) -> V2 { V2 { x: self.x - o.x, y: self.y - o.y } }
}
impl Mul<f64> for V2 {
    type Output = V2;
    fn mul(self, k: f64) -> V2 { V2 { x: self.x * k, y: self.y * k } }
}
impl Mul<V2> for f64 {
    type Output = V2;
    fn mul(self, v: V2) -> V2 { v * self }
}
impl Neg for V2 {
    type Output = V2;
    fn neg(self) -> V2 { V2 { x: -self.x, y: -self.y } }
}
impl AddAssign for V2 {
    fn add_assign(&mut self, o: V2) { self.x += o.x; self.y += o.y; }
}

struct Grid {
    w: usize,
    cells: Vec<i32>,
}
impl Index<(usize, usize)> for Grid {
    type Output = i32;
    fn index(&self, (r, c): (usize, usize)) -> &i32 { &self.cells[r * self.w + c] }
}
impl IndexMut<(usize, usize)> for Grid {
    fn index_mut(&mut self, (r, c): (usize, usize)) -> &mut i32 { &mut self.cells[r * self.w + c] }
}

fn main() {
    let a = V2 { x: 1.0, y: 2.0 };
    let b = V2 { x: 3.0, y: -1.0 };
    println!("{:?}", a + b);
    println!("{:?}", (a - b) * 2.0);
    println!("{:?}", 0.5 * -a);
    let mut c = a;
    c += b;
    println!("{:?}", c);

    let mut g = Grid { w: 3, cells: vec![0; 6] };
    g[(1, 2)] = 9;
    g[(0, 0)] += 4;
    println!("{} {} {:?}", g[(1, 2)], g[(0, 0)], g.cells);
}
