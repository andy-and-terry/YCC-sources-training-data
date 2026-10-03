const std = @import("std");

// Recursive flood fill over a 2D grid: replaces every connected cell
// equal to old_value, starting at (row, col), with new_value.
fn floodFill(grid: *[4][5]u8, row: i32, col: i32, old_value: u8, new_value: u8) void {
    if (row < 0 or row >= 4 or col < 0 or col >= 5) return;
    const r: usize = @intCast(row);
    const c: usize = @intCast(col);
    if (grid[r][c] != old_value) return;

    grid[r][c] = new_value;
    floodFill(grid, row + 1, col, old_value, new_value);
    floodFill(grid, row - 1, col, old_value, new_value);
    floodFill(grid, row, col + 1, old_value, new_value);
    floodFill(grid, row, col - 1, old_value, new_value);
}

pub fn main() void {
    var grid = [4][5]u8{
        .{ 1, 1, 0, 0, 0 },
        .{ 1, 1, 0, 0, 1 },
        .{ 0, 0, 1, 0, 1 },
        .{ 0, 0, 0, 1, 1 },
    };
    floodFill(&grid, 0, 0, 1, 9);
    for (grid) |row| {
        std.debug.print("{any}\n", .{row});
    }
}
