const std = @import("std");

const Flags = packed struct {
    read: bool,
    write: bool,
    execute: bool,
    reserved: u5 = 0,
};

fn flagsToByte(flags: Flags) u8 {
    return @bitCast(flags);
}

pub fn main() void {
    const flags = Flags{ .read = true, .write = true, .execute = false };
    const byte = flagsToByte(flags);
    std.debug.print("packed byte: {d}\n", .{byte});
    std.debug.print("size in bytes: {d}\n", .{@sizeOf(Flags)});
}
