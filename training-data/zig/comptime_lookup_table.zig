const std = @import("std");

fn buildSquares(comptime n: usize) [n]i32 {
    var table: [n]i32 = undefined;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        table[i] = @as(i32, @intCast(i * i));
    }
    return table;
}

const squares = buildSquares(10);

pub fn main() void {
    std.debug.print("{any}\n", .{squares});
    std.debug.print("{d}\n", .{squares[5]});
}
