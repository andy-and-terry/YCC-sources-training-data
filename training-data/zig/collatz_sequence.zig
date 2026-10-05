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
    std.debug.print("6 -> {d}\n", .{collatzSteps(6)});
    std.debug.print("27 -> {d}\n", .{collatzSteps(27)});

    var best: u64 = 1;
    var best_steps: u32 = 0;
    var n: u64 = 1;
    while (n < 1000) : (n += 1) {
        const s = collatzSteps(n);
        if (s > best_steps) {
            best_steps = s;
            best = n;
        }
    }
    std.debug.print("longest under 1000: {d} ({d} steps)\n", .{ best, best_steps });
}
