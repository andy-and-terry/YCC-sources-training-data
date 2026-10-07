const std = @import("std");

const Grid = [3][3]u8;

fn floodFill(grid: *Grid, row: usize, col: usize, new_color: u8) void {
    const old = grid[row][col];
    if (old == new_color) return;
    fill(grid, row, col, old, new_color);
}

fn fill(grid: *Grid, r: usize, c: usize, old: u8, new: u8) void {
    if (grid[r][c] != old) return;
    grid[r][c] = new;
    if (r + 1 < grid.len) fill(grid, r + 1, c, old, new);
    if (r > 0) fill(grid, r - 1, c, old, new);
    if (c + 1 < grid[0].len) fill(grid, r, c + 1, old, new);
    if (c > 0) fill(grid, r, c - 1, old, new);
}

pub fn main() void {
    var image: Grid = .{
        .{ 1, 1, 0 },
        .{ 1, 0, 0 },
        .{ 1, 1, 1 },
    };
    floodFill(&image, 0, 0, 7);
    for (image) |row| std.debug.print("{any}\n", .{row});
}
