const std = @import("std");

const Flags = packed struct {
    read: bool,
    write: bool,
    execute: bool,
    reserved: u5 = 0,
};

pub fn main() void {
    const f = Flags{ .read = true, .write = true, .execute = false };
    std.debug.print("{d}\n", .{@sizeOf(Flags)});
    std.debug.print("{}\n", .{f.read});
    std.debug.print("{}\n", .{f.write});
    std.debug.print("{}\n", .{f.execute});

    const raw: u8 = @bitCast(f);
    std.debug.print("{d}\n", .{raw});
}
