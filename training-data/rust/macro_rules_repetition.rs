macro_rules! hashmap {
    ($($k:expr => $v:expr),* $(,)?) => {{
        let mut m = ::std::collections::HashMap::new();
        $( m.insert($k, $v); )*
        m
    }};
}

macro_rules! max_of {
    ($x:expr) => ($x);
    ($x:expr, $($rest:expr),+) => {{
        let a = $x;
        let b = max_of!($($rest),+);
        if a > b { a } else { b }
    }};
}

macro_rules! make_struct {
    ($name:ident { $($field:ident : $ty:ty),* }) => {
        #[derive(Debug, Default)]
        struct $name { $($field: $ty),* }
        impl $name {
            fn field_names() -> &'static [&'static str] { &[$(stringify!($field)),*] }
        }
    };
}

make_struct!(Config { port: u16, host: String });

fn main() {
    let m = hashmap! { "a" => 1, "b" => 2, };
    println!("{}", m.len());
    println!("{}", max_of!(3, 9, 4));
    println!("{:?} {:?}", Config::default(), Config::field_names());
}
