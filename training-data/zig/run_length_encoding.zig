const std = @import("std");

fn runLengthEncode(allocator: std.mem.Allocator, input: []const u8) ![]u8 {
    var result = std.ArrayList(u8).init(allocator);
    defer result.deinit();

    var i: usize = 0;
    while (i < input.len) {
        const c = input[i];
        var count: usize = 1;
        while (i + count < input.len and input[i + count] == c) : (count += 1) {}
        try result.writer().print("{c}{d}", .{ c, count });
        i += count;
    }
    return result.toOwnedSlice();
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const encoded = try runLengthEncode(allocator, "aaabbbcccca");
    defer allocator.free(encoded);
    std.debug.print("{s}\n", .{encoded});

    const encoded2 = try runLengthEncode(allocator, "abcd");
    defer allocator.free(encoded2);
    std.debug.print("{s}\n", .{encoded2});
}
