// Converting bytes to strings: strict vs. lossy UTF-8 decoding.
use std::borrow::Cow;

fn main() {
    let good = vec![104, 105, 0xE2, 0x9C, 0x93];
    println!("{:?}", String::from_utf8(good.clone()));

    let bad = vec![104, 105, 0xFF, 33];
    match String::from_utf8(bad.clone()) {
        Ok(s) => println!("ok {}", s),
        Err(e) => println!("error at byte {}", e.utf8_error().valid_up_to()),
    }

    // Lossy replaces invalid sequences with U+FFFD.
    let lossy: Cow<str> = String::from_utf8_lossy(&bad);
    println!("{}", lossy);
    println!("{}", matches!(lossy, Cow::Owned(_)));
    println!("{}", matches!(String::from_utf8_lossy(&good), Cow::Borrowed(_)));

    println!("{:?}", std::str::from_utf8(&good[..2]));
    println!("{:?}", "héllo".as_bytes());
}
