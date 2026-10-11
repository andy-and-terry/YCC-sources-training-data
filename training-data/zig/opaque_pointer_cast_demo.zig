const std = @import("std");

const Counter = struct { hits: u32 };

fn bump(ctx: *anyopaque) void {
    const c: *Counter = @ptrCast(@alignCast(ctx));
    c.hits += 1;
}

pub fn main() void {
    var c = Counter{ .hits = 0 };
    const handler: *const fn (*anyopaque) void = bump;
    for (0..4) |_| handler(&c);
    std.debug.print("hits = {d}\n", .{c.hits});
}
