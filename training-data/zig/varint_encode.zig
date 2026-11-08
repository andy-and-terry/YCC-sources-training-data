const std = @import("std");

fn varint(n_in: u32, out: []u8) usize {
    var n = n_in;
    var i: usize = 0;
    while (n >= 0x80) : (i += 1) {
        out[i] = @as(u8, @truncate(n)) | 0x80;
        n >>= 7;
    }
    out[i] = @truncate(n);
    return i + 1;
}

pub fn main() void {
    var buf: [5]u8 = undefined;
    const len = varint(300, &buf);
    for (buf[0..len]) |b| std.debug.print("{x:0>2} ", .{b});
    std.debug.print("\n", .{});
}
