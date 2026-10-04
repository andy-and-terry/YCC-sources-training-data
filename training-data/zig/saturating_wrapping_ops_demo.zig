const std = @import("std");

pub fn main() void {
    const a: u8 = 250;
    const b: u8 = 10;

    std.debug.print("wrapping add: {d}\n", .{a +% b});
    std.debug.print("saturating add: {d}\n", .{a +| b});
    std.debug.print("wrapping sub: {d}\n", .{@as(u8, 5) -% 10});
    std.debug.print("saturating sub: {d}\n", .{@as(u8, 5) -| 10});
    std.debug.print("wrapping mul: {d}\n", .{@as(u8, 20) *% 20});
    std.debug.print("saturating mul: {d}\n", .{@as(u8, 20) *| 20});

    const x: i8 = -128;
    std.debug.print("wrapping negate: {d}\n", .{0 -% x});
    std.debug.print("saturating neg: {d}\n", .{@as(i8, 0) -| x});

    var counter: u3 = 6;
    var i: usize = 0;
    while (i < 4) : (i += 1) {
        counter +%= 1;
        std.debug.print("counter = {d}\n", .{counter});
    }

    var level: u8 = 250;
    level +|= 3;
    level +|= 3;
    std.debug.print("level = {d}\n", .{level});

    var hash: u32 = 2166136261;
    for ("zig") |byte| {
        hash ^= byte;
        hash *%= 16777619;
    }
    std.debug.print("fnv1a(zig) = {d}\n", .{hash});
}
