/// Cycle detection on a functional graph x -> f(x) (Floyd), e.g. a PRNG or an
/// index-based linked list; returns (mu = start index, lambda = cycle length).
fn floyd<T: PartialEq + Copy>(f: impl Fn(T) -> T, x0: T) -> (usize, usize) {
    let mut tortoise = f(x0);
    let mut hare = f(f(x0));
    while tortoise != hare {
        tortoise = f(tortoise);
        hare = f(f(hare));
    }
    let mut mu = 0;
    tortoise = x0;
    while tortoise != hare {
        tortoise = f(tortoise);
        hare = f(hare);
        mu += 1;
    }
    let mut lambda = 1;
    hare = f(tortoise);
    while tortoise != hare {
        hare = f(hare);
        lambda += 1;
    }
    (mu, lambda)
}

fn main() {
    // index-based linked list: node i points to next[i]
    let next = [1usize, 2, 3, 4, 5, 6, 7, 3];
    println!("list cycle: {:?}", floyd(|i: usize| next[i], 0));
    // cycle of the map x -> x^2 + 1 mod 255
    println!("x^2+1 mod 255 from 3: {:?}", floyd(|x: u32| (x * x + 1) % 255, 3));
}
