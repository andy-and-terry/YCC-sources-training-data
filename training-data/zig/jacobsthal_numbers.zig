// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
const std = @import("std");

pub fn main() void {
    var a: u32 = 0;
    var b: u32 = 1;
    var i: usize = 0;
    while (i < 15) : (i += 1) {
        std.debug.print("{d} ", .{a});
        const next = b + 2 * a;
        a = b;
        b = next;
    }
    std.debug.print("\n", .{});
}
