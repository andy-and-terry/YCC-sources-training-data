const ROMAN_VALUES: [(i32, &str); 13] = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I"),
];

fn to_roman(mut n: i32) -> String {
    let mut result = String::new();
    for &(value, symbol) in ROMAN_VALUES.iter() {
        while n >= value {
            result.push_str(symbol);
            n -= value;
        }
    }
    result
}

fn from_roman(s: &str) -> i32 {
    let value_of = |c: char| match c {
        'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
        'C' => 100, 'D' => 500, 'M' => 1000,
        _ => 0,
    };
    let chars: Vec<char> = s.chars().collect();
    let mut total = 0;
    for i in 0..chars.len() {
        let value = value_of(chars[i]);
        if i + 1 < chars.len() && value_of(chars[i + 1]) > value {
            total -= value;
        } else {
            total += value;
        }
    }
    total
}

fn main() {
    println!("{}", to_roman(1994));
    println!("{}", from_roman("MCMXCIV"));
}
