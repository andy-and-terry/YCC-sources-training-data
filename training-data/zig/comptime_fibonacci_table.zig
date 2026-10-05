const std = @import("std");

fn buildTable(comptime n: usize) [n]u64 {
    var table: [n]u64 = undefined;
    table[0] = 0;
    if (n > 1) table[1] = 1;
    var i: usize = 2;
    while (i < n) : (i += 1) {
        table[i] = table[i - 1] + table[i - 2];
    }
    return table;
}

// Evaluated entirely at compile time.
const fib_table = buildTable(20);

comptime {
    std.debug.assert(fib_table[10] == 55);
}

pub fn main() void {
    std.debug.print("fib(10) = {d}\n", .{fib_table[10]});
    std.debug.print("fib(19) = {d}\n", .{fib_table[19]});
    std.debug.print("table size: {d}\n", .{fib_table.len});
}
