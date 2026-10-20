use std::collections::HashSet;

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord, Hash, Clone)]
struct Version { major: u32, minor: u32, patch: u32 }

fn main() {
    let mut vs = vec![Version { major: 1, minor: 2, patch: 0 }, Version { major: 1, minor: 0, patch: 5 }, Version { major: 0, minor: 9, patch: 9 }];
    vs.sort();
    println!("{:?}", vs.iter().map(|v| format!("{}.{}.{}", v.major, v.minor, v.patch)).collect::<Vec<_>>());
    let set: HashSet<_> = vs.iter().cloned().collect();
    println!("{}", set.len());
}
