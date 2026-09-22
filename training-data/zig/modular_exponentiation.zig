const std = @import("std");

fn modPow(base_in: u64, exp_in: u64, modulus: u64) u64 {
    if (modulus == 1) return 0;
    var result: u64 = 1;
    var base = base_in % modulus;
    var exp = exp_in;
    while (exp > 0) {
        if (exp & 1 == 1) {
            result = (result * base) % modulus;
        }
        exp >>= 1;
        base = (base * base) % modulus;
    }
    return result;
}

pub fn main() void {
    std.debug.print("{d}\n", .{modPow(2, 10, 1000)});
    std.debug.print("{d}\n", .{modPow(7, 128, 13)});
    std.debug.print("{d}\n", .{modPow(5, 0, 7)});
}
