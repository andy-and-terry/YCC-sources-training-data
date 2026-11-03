const std = @import("std");

fn countPrimesBelow(comptime n: usize) usize {
    var composite = [_]bool{false} ** n;
    var count: usize = 0;
    var i: usize = 2;
    while (i < n) : (i += 1) {
        if (composite[i]) continue;
        count += 1;
        var j = i * i;
        while (j < n) : (j += i) composite[j] = true;
    }
    return count;
}

pub fn main() void {
    std.debug.print("{d}\n", .{countPrimesBelow(100)});
}
