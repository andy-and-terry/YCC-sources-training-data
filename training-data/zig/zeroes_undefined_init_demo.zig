const std = @import("std");

const Config = struct {
    id: u32,
    ratio: f32,
    flags: [4]u8,
    enabled: bool,
};

pub fn main() void {
    const zeroed = std.mem.zeroes(Config);
    std.debug.print("id={d} ratio={d} enabled={}\n", .{ zeroed.id, zeroed.ratio, zeroed.enabled });
    std.debug.print("flags={any}\n", .{zeroed.flags});

    // undefined leaves memory uninitialized; always assign before reading
    var buf: [4]u8 = undefined;
    for (&buf, 0..) |*b, i| {
        b.* = @intCast(i * 2);
    }
    std.debug.print("buf={any}\n", .{buf});

    var counter: u32 = undefined;
    counter = 10;
    std.debug.print("counter={d}\n", .{counter});
}
