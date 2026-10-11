fn find_pair(grid: &[[i32; 4]; 3], target: i32) -> Option<(usize, usize)> {
    let mut found = None;
    'outer: for (r, row) in grid.iter().enumerate() {
        for (c, &v) in row.iter().enumerate() {
            if v == target {
                found = Some((r, c));
                break 'outer;
            }
        }
    }
    found
}

fn main() {
    let g = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]];
    println!("{:?}", find_pair(&g, 7));
    println!("{:?}", find_pair(&g, 99));

    let mut n = 0;
    let result = loop {
        n += 3;
        if n > 20 {
            break n * 2;
        }
    };
    println!("loop value {}", result);

    let v = 'blk: {
        if n % 2 == 0 {
            break 'blk "even";
        }
        "odd"
    };
    println!("{}", v);
}
