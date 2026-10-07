const std = @import("std");

// Integer square root via binary search: largest r with r*r <= n.
// The candidate is squared in u64 to avoid overflowing u32 when the
// search range briefly probes values near the top of u32's range.
fn isqrt(n: u32) u32 {
    var lo: u32 = 0;
    var hi: u32 = n;
    var best: u32 = 0;
    while (lo <= hi) {
        const mid = lo + (hi - lo) / 2;
        const squared: u64 = @as(u64, mid) * @as(u64, mid);
        if (squared <= @as(u64, n)) {
            best = mid;
            lo = mid + 1;
        } else {
            if (mid == 0) break;
            hi = mid - 1;
        }
    }
    return best;
}

pub fn main() void {
    const inputs = [_]u32{ 0, 1, 4, 15, 16, 99, 100, 1000000 };
    for (inputs) |n| {
        std.debug.print("{d} -> {d}\n", .{ n, isqrt(n) });
    }
}
