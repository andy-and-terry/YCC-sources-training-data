const std = @import("std");

pub fn main() void {
    const msg = "AFFINE";
    var out: [msg.len]u8 = undefined;
    for (msg, 0..) |ch, i| {
        const x: u32 = ch - 'A';
        out[i] = @intCast('A' + (5 * x + 8) % 26);
    }
    std.debug.print("{s}\n", .{out});
}
