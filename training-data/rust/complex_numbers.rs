use std::f64::consts::PI;
use std::fmt;
use std::ops::{Add, Div, Mul, Sub};

#[derive(Clone, Copy, Debug, PartialEq)]
struct C {
    re: f64,
    im: f64,
}

impl C {
    const fn new(re: f64, im: f64) -> Self { C { re, im } }
    fn polar(r: f64, t: f64) -> Self { C::new(r * t.cos(), r * t.sin()) }
    fn abs(self) -> f64 { self.re.hypot(self.im) }
    fn conj(self) -> Self { C::new(self.re, -self.im) }
}

impl Add for C { type Output = C; fn add(self, o: C) -> C { C::new(self.re + o.re, self.im + o.im) } }
impl Sub for C { type Output = C; fn sub(self, o: C) -> C { C::new(self.re - o.re, self.im - o.im) } }
impl Mul for C {
    type Output = C;
    fn mul(self, o: C) -> C { C::new(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re) }
}
impl Div for C {
    type Output = C;
    fn div(self, o: C) -> C {
        let d = o.re * o.re + o.im * o.im;
        let n = self * o.conj();
        C::new(n.re / d, n.im / d)
    }
}
impl fmt::Display for C {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({:.3}{:+.3}i)", self.re, self.im)
    }
}

fn fft(a: &[C]) -> Vec<C> {
    let n = a.len();
    if n == 1 {
        return a.to_vec();
    }
    let even: Vec<C> = a.iter().step_by(2).copied().collect();
    let odd: Vec<C> = a.iter().skip(1).step_by(2).copied().collect();
    let (e, o) = (fft(&even), fft(&odd));
    let mut out = vec![C::new(0.0, 0.0); n];
    for k in 0..n / 2 {
        let t = C::polar(1.0, -2.0 * PI * k as f64 / n as f64) * o[k];
        out[k] = e[k] + t;
        out[k + n / 2] = e[k] - t;
    }
    out
}

fn main() {
    let (z1, z2) = (C::new(3.0, 4.0), C::new(1.0, -2.0));
    println!("{} {} {} |z1|={}", z1 + z2, z1 * z2, z1 / z2, z1.abs());
    println!("e^(i*pi) = {}", C::polar(1.0, PI));
    let sig: Vec<C> = [1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0].iter().map(|&x| C::new(x, 0.0)).collect();
    println!("{}", fft(&sig).iter().map(|c| c.to_string()).collect::<Vec<_>>().join(" "));
}
