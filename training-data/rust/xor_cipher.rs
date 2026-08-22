fn xor_transform(data: &[u8], key: &[u8]) -> Vec<u8> {
    data.iter().enumerate().map(|(i, &b)| b ^ key[i % key.len()]).collect()
}

fn main() {
    let key = b"secret";
    let ciphertext = xor_transform(b"hello world", key);
    println!("{:?}", ciphertext);
    println!("{}", String::from_utf8(xor_transform(&ciphertext, key)).unwrap());
}
