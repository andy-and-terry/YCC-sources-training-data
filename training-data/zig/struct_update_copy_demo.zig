const std = @import("std");

const Config = struct {
    width: u32 = 80,
    height: u32 = 24,
    color: bool = true,
};

pub fn main() void {
    const base = Config{};
    var wide = base;
    wide.width = 120;
    const mono = Config{ .width = base.width, .height = base.height, .color = false };
    std.debug.print("base {d}x{d} color={}\n", .{ base.width, base.height, base.color });
    std.debug.print("wide {d}x{d} color={}\n", .{ wide.width, wide.height, wide.color });
    std.debug.print("mono {d}x{d} color={}\n", .{ mono.width, mono.height, mono.color });
}
