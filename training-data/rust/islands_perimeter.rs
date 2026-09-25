fn island_perimeter(g: &[Vec<u8>]) -> usize {
    let at = |r: isize, c: isize| -> usize {
        if r < 0 || c < 0 {
            return 0;
        }
        g.get(r as usize).and_then(|row| row.get(c as usize)).copied().unwrap_or(0) as usize
    };
    let mut per = 0;
    for (r, row) in g.iter().enumerate() {
        for (c, &v) in row.iter().enumerate() {
            if v == 1 {
                let (r, c) = (r as isize, c as isize);
                per += 4 - at(r - 1, c) - at(r + 1, c) - at(r, c - 1) - at(r, c + 1);
            }
        }
    }
    per
}

fn main() {
    println!("{}", island_perimeter(&[vec![0, 1, 0, 0], vec![1, 1, 1, 0], vec![0, 1, 0, 0], vec![1, 1, 0, 0]]));
}
