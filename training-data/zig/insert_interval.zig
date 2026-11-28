const std = @import("std");

const Interval = struct { lo: i32, hi: i32 };

fn insertInterval(allocator: std.mem.Allocator, iv: []const Interval, nw: Interval) ![]Interval {
    var out = std.ArrayList(Interval).init(allocator);
    var cur = nw;
    var i: usize = 0;
    while (i < iv.len and iv[i].hi < cur.lo) : (i += 1) try out.append(iv[i]);
    while (i < iv.len and iv[i].lo <= cur.hi) : (i += 1) {
        cur.lo = @min(cur.lo, iv[i].lo);
        cur.hi = @max(cur.hi, iv[i].hi);
    }
    try out.append(cur);
    while (i < iv.len) : (i += 1) try out.append(iv[i]);
    return out.toOwnedSlice();
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const result = try insertInterval(gpa.allocator(), &[_]Interval{ .{ .lo = 1, .hi = 3 }, .{ .lo = 6, .hi = 9 } }, .{ .lo = 2, .hi = 5 });
    defer gpa.allocator().free(result);
    for (result) |r| std.debug.print("[{d},{d}] ", .{ r.lo, r.hi }); // [1,5] [6,9]
    std.debug.print("\n", .{});
}
