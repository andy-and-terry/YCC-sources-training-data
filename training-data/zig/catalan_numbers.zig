const std = @import("std");

// Catalan numbers via the DP recurrence
// C(0) = 1, C(k) = sum_{i=0}^{k-1} C(i) * C(k-1-i).
fn catalan(n: usize) u64 {
    var dp: [11]u64 = [_]u64{0} ** 11;
    dp[0] = 1;
    for (1..n + 1) |k| {
        var sum: u64 = 0;
        for (0..k) |i| {
            sum += dp[i] * dp[k - 1 - i];
        }
        dp[k] = sum;
    }
    return dp[n];
}

pub fn main() void {
    for (0..11) |n| {
        std.debug.print("C({d}) = {d}\n", .{ n, catalan(n) });
    }
}
