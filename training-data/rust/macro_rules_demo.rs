macro_rules! max_of {
    ($a:expr) => { $a };
    ($a:expr, $($rest:expr),+) => {
        {
            let a = $a;
            let rest_max = max_of!($($rest),+);
            if a > rest_max { a } else { rest_max }
        }
    };
}

macro_rules! make_getter {
    ($struct_name:ident, $field:ident, $method:ident, $ty:ty) => {
        impl $struct_name {
            fn $method(&self) -> $ty {
                self.$field
            }
        }
    };
}

struct Point {
    x: i32,
    y: i32,
}

make_getter!(Point, x, get_x, i32);
make_getter!(Point, y, get_y, i32);

fn main() {
    println!("{}", max_of!(3, 7, 2, 9, 4));

    let p = Point { x: 5, y: 12 };
    println!("{} {}", p.get_x(), p.get_y());
}
