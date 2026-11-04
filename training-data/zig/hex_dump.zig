const std = @import("std");

pub fn main() void {
    const data = "Hello, hex dump!\n\x01\x02 tail";
    var off: usize = 0;
    while (off < data.len) : (off += 16) {
        const end = @min(off + 16, data.len);
        std.debug.print("{x:0>8}  ", .{off});
        for (data[off..end]) |b| std.debug.print("{x:0>2} ", .{b});
        for (end - off..16) |_| std.debug.print("   ", .{});
        std.debug.print(" |", .{});
        for (data[off..end]) |b| std.debug.print("{c}", .{if (b >= 0x20 and b < 0x7f) b else '.'});
        std.debug.print("|\n", .{});
    }
}
