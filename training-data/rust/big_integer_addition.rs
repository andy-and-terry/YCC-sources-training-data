use std::fmt;
use std::ops::{Add, Mul};

/// Non-negative big integer, base 10^9, little-endian limbs.
#[derive(Clone, Debug, PartialEq)]
struct BigUint(Vec<u32>);

const BASE: u64 = 1_000_000_000;

impl BigUint {
    fn from_u64(mut v: u64) -> Self {
        let mut limbs = vec![];
        loop {
            limbs.push((v % BASE) as u32);
            v /= BASE;
            if v == 0 {
                break;
            }
        }
        BigUint(limbs)
    }

    fn parse(s: &str) -> Self {
        let bytes = s.as_bytes();
        let limbs = bytes
            .rchunks(9)
            .map(|chunk| std::str::from_utf8(chunk).unwrap().parse::<u32>().unwrap())
            .collect();
        BigUint(limbs)
    }
}

impl Add for &BigUint {
    type Output = BigUint;
    fn add(self, o: &BigUint) -> BigUint {
        let mut out = Vec::new();
        let mut carry = 0u64;
        for i in 0..self.0.len().max(o.0.len()) {
            let s = carry + *self.0.get(i).unwrap_or(&0) as u64 + *o.0.get(i).unwrap_or(&0) as u64;
            out.push((s % BASE) as u32);
            carry = s / BASE;
        }
        if carry > 0 {
            out.push(carry as u32);
        }
        BigUint(out)
    }
}

impl Mul for &BigUint {
    type Output = BigUint;
    fn mul(self, o: &BigUint) -> BigUint {
        let mut tmp = vec![0u64; self.0.len() + o.0.len()];
        for (i, &a) in self.0.iter().enumerate() {
            let mut carry = 0u64;
            for (j, &b) in o.0.iter().enumerate() {
                let cur = tmp[i + j] + a as u64 * b as u64 + carry;
                tmp[i + j] = cur % BASE;
                carry = cur / BASE;
            }
            tmp[i + o.0.len()] += carry;
        }
        while tmp.len() > 1 && *tmp.last().unwrap() == 0 {
            tmp.pop();
        }
        BigUint(tmp.into_iter().map(|x| x as u32).collect())
    }
}

impl fmt::Display for BigUint {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut it = self.0.iter().rev();
        write!(f, "{}", it.next().unwrap())?;
        for limb in it {
            write!(f, "{:09}", limb)?;
        }
        Ok(())
    }
}

fn main() {
    println!("{}", &BigUint::parse("99999999999999999999") + &BigUint::from_u64(1));
    let fact = (2..=50u64).fold(BigUint::from_u64(1), |acc, i| &acc * &BigUint::from_u64(i));
    println!("50! = {}", fact);
}
