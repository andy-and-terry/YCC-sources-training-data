use std::collections::HashSet;

fn ulam(count: usize) -> Vec<u32> {
    let mut terms = vec![1u32, 2];
    let mut members: HashSet<u32> = HashSet::from([1, 2]);
    let mut cand = 2;
    while terms.len() < count {
        cand += 1;
        let ways = terms
            .iter()
            .filter(|&&a| a < cand - a && members.contains(&(cand - a)))
            .count();
        if ways == 1 {
            terms.push(cand);
            members.insert(cand);
        }
    }
    terms
}

fn main() {
    let strs: Vec<String> = ulam(15).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
