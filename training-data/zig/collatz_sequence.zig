const std = @import("std");

fn collatzSteps(start: u64) u32 {
    var n = start;
    var steps: u32 = 0;
    while (n != 1) : (steps += 1) {
        n = if (n % 2 == 0) n / 2 else 3 * n + 1;
    }
    return steps;
}

pub fn main() void {
    var n: u64 = 6;
    std.debug.print("{d}", .{n});
    while (n != 1) {
        n = if (n % 2 == 0) n / 2 else 3 * n + 1;
        std.debug.print(" -> {d}", .{n});
    }
    std.debug.print("\n", .{});
    std.debug.print("steps(27) = {d}\n", .{collatzSteps(27)});
}
