const std = @import("std");

pub fn main() void {
    const v: u32 = 0x11223344;
    const swapped = @byteSwap(v);
    std.debug.print("0x{X} -> 0x{X}\n", .{ v, swapped });

    var buf: [4]u8 = undefined;
    std.mem.writeInt(u32, &buf, v, .big);
    std.debug.print("big:    {x} {x} {x} {x}\n", .{ buf[0], buf[1], buf[2], buf[3] });
    std.mem.writeInt(u32, &buf, v, .little);
    std.debug.print("little: {x} {x} {x} {x}\n", .{ buf[0], buf[1], buf[2], buf[3] });
    std.debug.print("read back: 0x{X}\n", .{std.mem.readInt(u32, &buf, .little)});
}
