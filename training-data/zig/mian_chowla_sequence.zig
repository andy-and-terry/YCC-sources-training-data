const std = @import("std");

// Greedy sequence whose pairwise sums are all distinct.
pub fn main() void {
    var seq: [8]u32 = undefined;
    var n: usize = 0;
    var used = [_]bool{false} ** 256;
    var cand: u32 = 1;
    while (n < 8) : (cand += 1) {
        var fresh = [_]bool{false} ** 256;
        var ok = true;
        seq[n] = cand;
        var i: usize = 0;
        while (i <= n and ok) : (i += 1) {
            const s = seq[i] + cand;
            if (used[s] or fresh[s]) ok = false else fresh[s] = true;
        }
        if (ok) {
            for (fresh, 0..) |f, s| {
                if (f) used[s] = true;
            }
            n += 1;
        }
    }
    for (seq) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
