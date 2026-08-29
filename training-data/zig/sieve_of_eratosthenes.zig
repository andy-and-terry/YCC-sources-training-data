const std = @import("std");

fn sieve(limit: usize, buffer: []bool) []usize {
    for (buffer) |*v| v.* = false;
    var i: usize = 2;
    while (i * i <= limit) : (i += 1) {
        if (!buffer[i]) {
            var j = i * i;
            while (j <= limit) : (j += i) {
                buffer[j] = true;
            }
        }
    }
    var count: usize = 0;
    var primes: [50]usize = undefined;
    i = 2;
    while (i <= limit) : (i += 1) {
        if (!buffer[i]) {
            primes[count] = i;
            count += 1;
        }
    }
    return primes[0..count];
}

pub fn main() void {
    var buffer: [51]bool = undefined;
    const primes = sieve(50, &buffer);
    std.debug.print("{any}\n", .{primes});
}
