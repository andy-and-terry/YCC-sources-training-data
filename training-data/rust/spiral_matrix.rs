fn spiral(n: usize) -> Vec<Vec<u32>> {
    let mut g = vec![vec![0u32; n]; n];
    let dirs: [(i32, i32); 4] = [(0, 1), (1, 0), (0, -1), (-1, 0)];
    let (mut r, mut c, mut d) = (0i32, 0i32, 0usize);
    for k in 1..=(n * n) as u32 {
        g[r as usize][c as usize] = k;
        let (nr, nc) = (r + dirs[d].0, c + dirs[d].1);
        let blocked = nr < 0 || nc < 0 || nr >= n as i32 || nc >= n as i32 || g[nr as usize][nc as usize] != 0;
        if blocked {
            d = (d + 1) % 4;
        }
        r += dirs[d].0;
        c += dirs[d].1;
    }
    g
}

fn main() {
    for row in spiral(4) {
        println!("{:?}", row);
    }
}
