const std = @import("std");

fn cStrLen(s: [*:0]const u8) usize {
    var len: usize = 0;
    while (s[len] != 0) : (len += 1) {}
    return len;
}

pub fn main() void {
    const greeting: [*:0]const u8 = "hello, zig";
    std.debug.print("{d}\n", .{cStrLen(greeting)});

    const words = [_:null]?[]const u8{ "one", "two", "three" };
    var i: usize = 0;
    while (words[i]) |word| : (i += 1) {
        std.debug.print("{s}\n", .{word});
    }
}
