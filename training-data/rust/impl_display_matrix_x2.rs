use std::fmt;

struct M([[i32; 2]; 2]);

impl fmt::Display for M {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        for r in &self.0 { writeln!(f, "{} {}", r[0], r[1])?; }
        Ok(())
    }
}

fn main() { print!("{}", M([[1, 2], [3, 4]])); }
