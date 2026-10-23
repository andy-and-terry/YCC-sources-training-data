const std = @import("std");

pub fn main() !void {
    const text = "héllo, 世界!";

    std.debug.print("bytes: {d}\n", .{text.len});
    std.debug.print("codepoints: {d}\n", .{try std.unicode.utf8CountCodepoints(text)});
    std.debug.print("valid utf8: {}\n", .{std.unicode.utf8ValidateSlice(text)});

    var it = (try std.unicode.Utf8View.init(text)).iterator();
    while (it.nextCodepointSlice()) |slice| {
        const cp = try std.unicode.utf8Decode(slice);
        std.debug.print("U+{X:0>4} len={d} '{s}'\n", .{ cp, slice.len, slice });
    }

    var buf: [4]u8 = undefined;
    const n = try std.unicode.utf8Encode(0x1F600, &buf);
    std.debug.print("encoded emoji in {d} bytes\n", .{n});
    std.debug.print("invalid: {}\n", .{std.unicode.utf8ValidateSlice("\xff\xfe")});
}
