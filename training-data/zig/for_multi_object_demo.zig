const std = @import("std");

pub fn main() void {
    const names = [_][]const u8{ "ada", "bob", "cy" };
    const ages = [_]u32{ 36, 41, 29 };

    // iterate two slices in lockstep
    for (names, ages) |name, age| {
        std.debug.print("{s} is {d}\n", .{ name, age });
    }

    // add a range to get an index
    for (names, 0..) |name, i| {
        std.debug.print("{d}: {s}\n", .{ i, name });
    }

    // capture by pointer to mutate in place
    var values = [_]i32{ 1, 2, 3 };
    for (&values) |*v| {
        v.* *= 10;
    }
    std.debug.print("{any}\n", .{values});
}
