fn roman_to_int(s: &str) -> Option<u32> {
    let value = |c| match c {
        'I' => Some(1),
        'V' => Some(5),
        'X' => Some(10),
        'L' => Some(50),
        'C' => Some(100),
        'D' => Some(500),
        'M' => Some(1000),
        _ => None,
    };
    let vals: Option<Vec<u32>> = s.chars().map(value).collect();
    let vals = vals?;
    let mut total = 0;
    for (i, &v) in vals.iter().enumerate() {
        if vals.get(i + 1).map_or(false, |&next| next > v) {
            total -= v as i32;
        } else {
            total += v as i32;
        }
    }
    Some(total as u32)
}

fn main() {
    for r in ["III", "IV", "IX", "LVIII", "MCMXCIV", "ABC"] {
        println!("{} -> {:?}", r, roman_to_int(r));
    }
}
