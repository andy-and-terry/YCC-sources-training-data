const std = @import("std");

pub fn main() !void {
    var backing: [256]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&backing);

    for (0..3) |round| {
        fba.reset();
        const a = fba.allocator();
        const nums = try a.alloc(u32, 8);
        for (nums, 0..) |*n, i| n.* = @intCast(i * (round + 1));
        var sum: u32 = 0;
        for (nums) |n| sum += n;
        std.debug.print("round {d}: sum = {d}\n", .{ round, sum });
    }
    const too_big = fba.allocator().alloc(u8, 1000);
    std.debug.print("big alloc: {s}\n", .{if (too_big) |_| "ok" else |e| @errorName(e)});
}
