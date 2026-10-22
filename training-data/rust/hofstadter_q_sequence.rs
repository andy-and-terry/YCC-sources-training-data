// Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), Q(1) = Q(2) = 1
fn hofstadter_q(count: usize) -> Vec<usize> {
    let mut q = vec![0usize; count + 1];
    q[1] = 1;
    q[2] = 1;
    for n in 3..=count {
        q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
    }
    q[1..].to_vec()
}

fn main() {
    let strs: Vec<String> = hofstadter_q(20).iter().map(|v| v.to_string()).collect();
    println!("{}", strs.join(" "));
}
