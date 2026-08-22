const std = @import("std");

fn isPrime(n: i32) bool {
    if (n < 2) return false;
    var i: i32 = 2;
    while (i * i <= n) : (i += 1) {
        if (@mod(n, i) == 0) return false;
    }
    return true;
}

pub fn main() void {
    var n: i32 = 2;
    while (n <= 20) : (n += 1) {
        if (isPrime(n)) {
            std.debug.print("{} ", .{n});
        }
    }
    std.debug.print("\n", .{});
}
