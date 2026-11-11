const std = @import("std");

fn fourSumCount(allocator: std.mem.Allocator, a: []const i32, b: []const i32, c: []const i32, d: []const i32) !u32 {
    var sums = std.AutoHashMap(i32, u32).init(allocator);
    defer sums.deinit();
    for (a) |x| {
        for (b) |y| {
            const entry = try sums.getOrPut(x + y);
            if (!entry.found_existing) entry.value_ptr.* = 0;
            entry.value_ptr.* += 1;
        }
    }
    var count: u32 = 0;
    for (c) |x| {
        for (d) |y| count += sums.get(-(x + y)) orelse 0;
    }
    return count;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const n = try fourSumCount(gpa.allocator(), &[_]i32{ 1, 2 }, &[_]i32{ -2, -1 }, &[_]i32{ -1, 2 }, &[_]i32{ 0, 2 });
    std.debug.print("{d}\n", .{n}); // 2
}
