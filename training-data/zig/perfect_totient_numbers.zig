const std = @import("std");

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
fn phi(n: u32) u32 {
    var c: u32 = 0;
    var k: u32 = 1;
    while (k <= n) : (k += 1) {
        if (std.math.gcd(k, n) == 1) c += 1;
    }
    return c;
}

fn isPerfectTotient(n: u32) bool {
    var total: u32 = 0;
    var m = n;
    while (m > 1) {
        m = phi(m);
        total += m;
    }
    return total == n;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 200) : (n += 1) {
        if (isPerfectTotient(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
}
