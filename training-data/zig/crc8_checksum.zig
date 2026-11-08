const std = @import("std");

fn crc8(data: []const u8) u8 {
    var crc: u8 = 0;
    for (data) |b| {
        crc ^= b;
        for (0..8) |_| {
            crc = if (crc & 0x80 != 0) (crc << 1) ^ 0x07 else crc << 1;
        }
    }
    return crc;
}

pub fn main() void {
    std.debug.print("{x:0>2}\n", .{crc8("123456789")});
}
