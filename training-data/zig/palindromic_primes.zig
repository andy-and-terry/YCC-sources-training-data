const std = @import("std");

fn isPrime(n: u32) bool {
    if (n < 2) return false;
    var i: u32 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

fn isPalindrome(n: u32) bool {
    var m = n;
    var r: u32 = 0;
    while (m > 0) : (m /= 10) r = r * 10 + m % 10;
    return r == n;
}

pub fn main() void {
    var n: u32 = 2;
    while (n < 200) : (n += 1) {
        if (isPalindrome(n) and isPrime(n)) std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{}); // 2 3 5 7 11 101 131 151 181 191
}
