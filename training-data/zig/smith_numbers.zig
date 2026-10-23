const std = @import("std");

fn digitSum(n0: u32) u32 {
    var n = n0;
    var s: u32 = 0;
    while (n > 0) : (n /= 10) s += n % 10;
    return s;
}

fn isSmith(n0: u32) bool {
    var n = n0;
    var p: u32 = 2;
    var count: u32 = 0;
    var fsum: u32 = 0;
    while (n > 1) {
        if (p * p > n) {
            count += 1;
            fsum += digitSum(n);
            break;
        }
        while (n % p == 0) {
            count += 1;
            fsum += digitSum(p);
            n /= p;
        }
        p += 1;
    }
    return count > 1 and digitSum(n0) == fsum;
}

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    var first = true;
    var n: u32 = 2;
    while (n < 100) : (n += 1) {
        if (!isSmith(n)) continue;
        if (!first) try out.writeByte(' ');
        first = false;
        try out.print("{d}", .{n});
    }
    try out.writeByte('\n');
}
