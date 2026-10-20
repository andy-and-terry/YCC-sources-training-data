use std::convert::TryFrom;

#[derive(Debug)]
struct Percent(u8);

impl TryFrom<i32> for Percent {
    type Error = String;

    fn try_from(v: i32) -> Result<Self, Self::Error> {
        if (0..=100).contains(&v) {
            Ok(Percent(v as u8))
        } else {
            Err(format!("{v} is out of range"))
        }
    }
}

fn main() {
    println!("{:?} {:?}", Percent::try_from(50), Percent::try_from(101));
    let p: Result<Percent, _> = (-1).try_into();
    println!("{:?}", p);
    println!("{:?} {:?}", u8::try_from(300_i32).is_err(), i8::try_from(127_u64));
    println!("{:?}", char::try_from(0x41_u32));
    println!("{:?}", char::from_u32(0xD800));
    let arr: Result<[i32; 3], _> = vec![1, 2, 3].try_into();
    println!("{:?}", arr);
    let bad: Result<[i32; 2], _> = vec![1, 2, 3].try_into();
    println!("{:?}", bad);
}
