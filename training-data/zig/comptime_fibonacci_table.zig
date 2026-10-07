const std = @import("std");

// Computed entirely at compile time and stored in the binary
const fib_table = blk: {
    var table: [20]u32 = undefined;
    table[0] = 0;
    table[1] = 1;
    for (2..table.len) |i| {
        table[i] = table[i - 1] + table[i - 2];
    }
    break :blk table;
};

fn fibAt(n: usize) u32 {
    return fib_table[n];
}

pub fn main() void {
    std.debug.print("fib(10) = {d}\n", .{fibAt(10)});
    std.debug.print("fib(19) = {d}\n", .{fibAt(19)});
    std.debug.print("table = {any}\n", .{fib_table});

    // Compile-time assertion
    comptime std.debug.assert(fib_table[10] == 55);
}
