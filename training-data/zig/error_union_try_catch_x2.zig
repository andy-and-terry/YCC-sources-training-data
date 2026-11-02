const std = @import("std");

fn parse(s: []const u8) !u32 {
    return std.fmt.parseInt(u32, s, 10);
}

pub fn main() void {
    const v = parse("12x") catch |e| {
        std.debug.print("error: {}\n", .{e});
        return;
    };
    std.debug.print("{}\n", .{v});
}
