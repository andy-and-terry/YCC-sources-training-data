const std = @import("std");

fn persistence(value: u64) u32 {
    var n = value;
    var steps: u32 = 0;
    while (n >= 10) {
        var product: u64 = 1;
        while (n > 0) : (n /= 10) product *= n % 10;
        n = product;
        steps += 1;
    }
    return steps;
}

pub fn main() void {
    for ([_]u64{ 39, 77, 999, 10 }) |n| {
        std.debug.print("{d} {d}\n", .{ n, persistence(n) });
    }
}
