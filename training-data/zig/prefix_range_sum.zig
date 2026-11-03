const std = @import("std");

pub fn main() void {
    const values = [_]i64{ 3, 1, 4, 1, 5, 9, 2, 6 };
    var prefix: [values.len + 1]i64 = undefined;
    prefix[0] = 0;
    for (values, 0..) |v, i| prefix[i + 1] = prefix[i] + v;
    std.debug.print("{d}\n", .{prefix[5] - prefix[2]});
}
