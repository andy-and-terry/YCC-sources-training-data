const std = @import("std");

fn incAll(items: []i32) void {
    for (items) |*p| p.* += 1;
}

fn cLen(s: [*:0]const u8) usize {
    var n: usize = 0;
    while (s[n] != 0) n += 1;
    return n;
}

pub fn main() void {
    var arr = [_]i32{ 1, 2, 3 };
    incAll(&arr);
    std.debug.print("{any}\n", .{arr});
    var x: i32 = 5;
    const p = &x;
    p.* *= 2;
    std.debug.print("{d}\n", .{x});
    const pp: *const *i32 = &p;
    std.debug.print("{d}\n", .{pp.*.*});
    std.debug.print("{d}\n", .{cLen("sentinel")});
    const slice: []const i32 = arr[1..];
    std.debug.print("{d} {d}\n", .{ slice.len, slice[0] });
    const ptr: [*]i32 = &arr;
    std.debug.print("{d}\n", .{ptr[2]});
    var opt: ?*i32 = null;
    std.debug.print("{any}\n", .{opt == null});
    opt = &x;
    if (opt) |q| q.* = 99;
    std.debug.print("{d}\n", .{x});
    std.debug.print("{d} {d}\n", .{ @sizeOf(i32), @alignOf(u64) });
}
