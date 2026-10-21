// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
const std = @import("std");

pub fn main() void {
    var a: u64 = 0;
    var b: u64 = 0;
    var c: u64 = 1;

    std.debug.print("Tribonacci:", .{});
    for (0..15) |_| {
        std.debug.print(" {d}", .{a});
        const next = a + b + c;
        a = b;
        b = c;
        c = next;
    }
    std.debug.print("\n", .{});
}
