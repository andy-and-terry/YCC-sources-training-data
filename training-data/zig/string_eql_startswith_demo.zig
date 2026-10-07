const std = @import("std");
const mem = std.mem;

pub fn main() void {
    const s = "hello, zig world";

    std.debug.print("eql: {any} {any}\n", .{ mem.eql(u8, "abc", "abc"), mem.eql(u8, "abc", "abd") });
    std.debug.print("startsWith: {any}\n", .{mem.startsWith(u8, s, "hello")});
    std.debug.print("endsWith: {any}\n", .{mem.endsWith(u8, s, "world")});
    std.debug.print("indexOf: {any}\n", .{mem.indexOf(u8, s, "zig")});
    std.debug.print("indexOf missing: {any}\n", .{mem.indexOf(u8, s, "rust")});
    std.debug.print("indexOfScalar: {any}\n", .{mem.indexOfScalar(u8, s, ',')});
    std.debug.print("lastIndexOfScalar: {any}\n", .{mem.lastIndexOfScalar(u8, s, 'o')});
    std.debug.print("count of 'o': {d}\n", .{mem.count(u8, s, "o")});
    std.debug.print("order: {any}\n", .{mem.order(u8, "apple", "banana")});
    std.debug.print("lessThan: {any}\n", .{mem.lessThan(u8, "apple", "banana")});

    std.debug.print("trim: [{s}]\n", .{mem.trim(u8, "  padded  ", " ")});

    var it = mem.splitScalar(u8, "a,b,,c", ',');
    while (it.next()) |part| {
        std.debug.print("part: [{s}]\n", .{part});
    }

    var words = mem.tokenizeScalar(u8, "  the  quick brown  fox ", ' ');
    var n: usize = 0;
    while (words.next()) |_| n += 1;
    std.debug.print("{d} words\n", .{n});
}
