fn hex_dump(data: &[u8]) {
    for (i, chunk) in data.chunks(16).enumerate() {
        let hex: Vec<String> = chunk.iter().map(|b| format!("{:02x}", b)).collect();
        let text: String = chunk
            .iter()
            .map(|&b| if (0x20..0x7f).contains(&b) { b as char } else { '.' })
            .collect();
        println!("{:08x}  {:<47}  |{}|", i * 16, hex.join(" "), text);
    }
}

fn main() {
    hex_dump(b"Hello, hex dump!\n\x00\x01\x02 end");
}
