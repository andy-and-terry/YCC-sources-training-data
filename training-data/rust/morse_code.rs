use std::collections::HashMap;

const TABLE: [(char, &str); 36] = [
    ('A', ".-"), ('B', "-..."), ('C', "-.-."), ('D', "-.."), ('E', "."), ('F', "..-."), ('G', "--."),
    ('H', "...."), ('I', ".."), ('J', ".---"), ('K', "-.-"), ('L', ".-.."), ('M', "--"), ('N', "-."),
    ('O', "---"), ('P', ".--."), ('Q', "--.-"), ('R', ".-."), ('S', "..."), ('T', "-"), ('U', "..-"),
    ('V', "...-"), ('W', ".--"), ('X', "-..-"), ('Y', "-.--"), ('Z', "--.."), ('0', "-----"),
    ('1', ".----"), ('2', "..---"), ('3', "...--"), ('4', "....-"), ('5', "....."), ('6', "-...."),
    ('7', "--..."), ('8', "---.."), ('9', "----."),
];

fn encode(text: &str) -> String {
    let map: HashMap<char, &str> = TABLE.iter().copied().collect();
    text.split_whitespace()
        .map(|w| w.chars().filter_map(|c| map.get(&c.to_ascii_uppercase()).copied()).collect::<Vec<_>>().join(" "))
        .collect::<Vec<_>>()
        .join(" / ")
}

fn decode(code: &str) -> String {
    let map: HashMap<&str, char> = TABLE.iter().map(|&(c, m)| (m, c)).collect();
    code.split(" / ")
        .map(|w| w.split_whitespace().map(|s| *map.get(s).unwrap_or(&'?')).collect::<String>())
        .collect::<Vec<_>>()
        .join(" ")
}

fn main() {
    let m = encode("SOS help 2024");
    println!("{}\n{}", m, decode(&m));
}
