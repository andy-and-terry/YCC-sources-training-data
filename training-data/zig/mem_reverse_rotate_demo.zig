const std = @import("std");

pub fn main() void {
    var a = [_]i32{ 1, 2, 3, 4, 5, 6 };
    std.mem.reverse(i32, &a);
    std.debug.print("reversed: {any}\n", .{a});
    std.mem.rotate(i32, &a, 2);
    std.debug.print("rotated:  {any}\n", .{a});
    std.mem.swap(i32, &a[0], &a[5]);
    std.debug.print("swapped:  {any}\n", .{a});
    std.debug.print("min {d} max {d}\n", .{ std.mem.min(i32, &a), std.mem.max(i32, &a) });
}
