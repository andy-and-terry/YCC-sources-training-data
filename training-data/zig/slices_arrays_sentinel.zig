const std = @import("std");
pub fn main() void {
    const a = [_]u8{ 1, 2, 3, 4, 5 };
    const s = a[1..4];
    var sum: u32 = 0;
    for (s) |b| sum += b;
    std.debug.print("{} {} {s}\n", .{ s.len, sum, "hi" });
}
