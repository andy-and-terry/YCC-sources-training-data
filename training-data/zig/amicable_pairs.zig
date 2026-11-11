// Amicable pairs: d(a) == b and d(b) == a with a != b.
const std = @import("std");

fn d(n: u32) u32 {
    var s: u32 = 0;
    var i: u32 = 1;
    while (i < n) : (i += 1) {
        if (n % i == 0) s += i;
    }
    return s;
}

pub fn main() void {
    var a: u32 = 2;
    while (a < 1500) : (a += 1) {
        const b = d(a);
        if (b > a and d(b) == a) std.debug.print("{d} {d}\n", .{ a, b });
    }
}
