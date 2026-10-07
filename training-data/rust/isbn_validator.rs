#[derive(Debug, PartialEq)]
enum Isbn {
    Ten(String),
    Thirteen(String),
}

#[derive(Debug, PartialEq)]
enum IsbnError {
    Length(usize),
    BadChar(char),
    Checksum,
}

fn parse_isbn(raw: &str) -> Result<Isbn, IsbnError> {
    let s: String = raw.chars().filter(|c| *c != '-' && *c != ' ').collect::<String>().to_uppercase();
    let values = |allow_x: bool| -> Result<Vec<u32>, IsbnError> {
        s.chars()
            .enumerate()
            .map(|(i, c)| match c {
                '0'..='9' => Ok(c.to_digit(10).unwrap()),
                'X' if allow_x && i == s.len() - 1 => Ok(10),
                _ => Err(IsbnError::BadChar(c)),
            })
            .collect()
    };
    match s.len() {
        10 => {
            let total: u32 = values(true)?.iter().enumerate().map(|(i, v)| (10 - i as u32) * v).sum();
            if total % 11 == 0 { Ok(Isbn::Ten(s)) } else { Err(IsbnError::Checksum) }
        }
        13 => {
            let total: u32 = values(false)?.iter().enumerate().map(|(i, v)| if i % 2 == 0 { *v } else { 3 * v }).sum();
            if total % 10 == 0 { Ok(Isbn::Thirteen(s)) } else { Err(IsbnError::Checksum) }
        }
        n => Err(IsbnError::Length(n)),
    }
}

fn main() {
    for s in ["0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "0-8044-2957-X", "12345", "0-306-4O615-2"] {
        println!("{:20} {:?}", s, parse_isbn(s));
    }
}
