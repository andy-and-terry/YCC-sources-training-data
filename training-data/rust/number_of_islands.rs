fn flood_fill(grid: &mut Vec<Vec<char>>, row: i32, col: i32) {
    if row < 0 || col < 0 || row as usize >= grid.len() || col as usize >= grid[0].len() {
        return;
    }
    let (r, c) = (row as usize, col as usize);
    if grid[r][c] != '1' {
        return;
    }
    grid[r][c] = '0';
    flood_fill(grid, row + 1, col);
    flood_fill(grid, row - 1, col);
    flood_fill(grid, row, col + 1);
    flood_fill(grid, row, col - 1);
}

fn count_islands(mut grid: Vec<Vec<char>>) -> u32 {
    let mut count = 0;
    let rows = grid.len();
    let cols = if rows > 0 { grid[0].len() } else { 0 };

    for r in 0..rows {
        for c in 0..cols {
            if grid[r][c] == '1' {
                count += 1;
                flood_fill(&mut grid, r as i32, c as i32);
            }
        }
    }

    count
}

fn main() {
    let grid = vec![
        vec!['1', '1', '0', '0', '0'],
        vec!['1', '1', '0', '0', '0'],
        vec!['0', '0', '1', '0', '0'],
        vec!['0', '0', '0', '1', '1'],
    ];
    println!("{}", count_islands(grid));
}
