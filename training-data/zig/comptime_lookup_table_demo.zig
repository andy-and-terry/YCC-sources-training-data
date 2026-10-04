const std = @import("std");

const table = blk: {
    var t: [16]u8 = undefined;
    for (&t, 0..) |*slot, i| {
        slot.* = @as(u8, @intCast(i * i));
    }
    break :blk t;
};

fn popcountTable() [256]u8 {
    @setEvalBranchQuota(10000);
    var counts: [256]u8 = undefined;
    for (&counts, 0..) |*c, i| {
        var v: usize = i;
        var bits: u8 = 0;
        while (v != 0) : (v >>= 1) {
            bits += @as(u8, @intCast(v & 1));
        }
        c.* = bits;
    }
    return counts;
}

const popcounts = popcountTable();

fn popcount32(x: u32) u32 {
    return popcounts[x & 0xff] + popcounts[(x >> 8) & 0xff] + popcounts[(x >> 16) & 0xff] + popcounts[x >> 24];
}

pub fn main() void {
    std.debug.print("squares: {any}\n", .{table});
    std.debug.print("table[7] = {d}\n", .{table[7]});
    std.debug.print("popcount32(0xF0F0F0F0) = {d}\n", .{popcount32(0xF0F0F0F0)});
    std.debug.print("popcount32(255) = {d}\n", .{popcount32(255)});
    comptime {
        std.debug.assert(popcounts[255] == 8);
        std.debug.assert(table[15] == 225);
    }
    std.debug.print("compile-time checks passed\n", .{});
}
