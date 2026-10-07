const std = @import("std");

const INF: u64 = std.math.maxInt(u64);

// Minimum scalar multiplications to multiply a chain of matrices,
// given dims[i-1] x dims[i] as the shape of matrix i.
fn matrixChainOrder(dims: []const usize) u64 {
    const n = dims.len - 1;
    var dp: [5][5]u64 = [_][5]u64{[_]u64{0} ** 5} ** 5;

    var len: usize = 2;
    while (len <= n) {
        var i: usize = 1;
        while (i <= n - len + 1) {
            const j = i + len - 1;
            var best: u64 = INF;
            var k: usize = i;
            while (k < j) {
                const cost = dp[i][k] + dp[k + 1][j] + dims[i - 1] * dims[k] * dims[j];
                if (cost < best) best = cost;
                k += 1;
            }
            dp[i][j] = best;
            i += 1;
        }
        len += 1;
    }
    return dp[1][n];
}

pub fn main() void {
    const dims = [_]usize{ 40, 20, 30, 10, 30 };
    std.debug.print("{d}\n", .{matrixChainOrder(&dims)});
}
