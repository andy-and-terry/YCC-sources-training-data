const std = @import("std");

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
pub fn main() void {
    var row: [16]u64 = [_]u64{0} ** 16;
    var next: [16]u64 = [_]u64{0} ** 16;
    row[0] = 1;
    var len: usize = 1;
    std.debug.print("1 ", .{});
    var i: usize = 0;
    while (i < 9) : (i += 1) {
        next[0] = 0;
        var j: usize = len;
        while (j > 0) : (j -= 1) next[len - j + 1] = next[len - j] + row[j - 1];
        len += 1;
        row = next;
        std.debug.print("{d} ", .{row[len - 1]});
    }
    std.debug.print("\n", .{});
}
