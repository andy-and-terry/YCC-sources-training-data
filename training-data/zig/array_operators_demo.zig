const std = @import("std");

const header = [_]u8{ 0xCA, 0xFE };
const payload = [_]u8{ 1, 2, 3 };
const packet = header ++ payload;
const padding = [_]u8{0} ** 4;
const zero_row = [_]i32{0} ** 3;

pub fn main() void {
    std.debug.print("packet len {d}\n", .{packet.len});
    for (packet) |b| {
        std.debug.print("{x:0>2} ", .{b});
    }
    std.debug.print("\n", .{});
    std.debug.print("padding: {any}\n", .{padding});
    std.debug.print("zero_row: {any}\n", .{zero_row});

    const greeting = "hello, " ++ "zig";
    std.debug.print("{s} ({d} bytes)\n", .{ greeting, greeting.len });

    const sub = packet[1..4];
    std.debug.print("slice: {any} len={d}\n", .{ sub, sub.len });
}
