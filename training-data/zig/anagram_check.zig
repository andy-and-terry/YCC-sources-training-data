const std = @import("std");
const allocator = std.heap.page_allocator;

fn normalize(s: []const u8) ![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    for (s) |c| {
        if (c != ' ') try list.append(std.ascii.toLower(c));
    }
    std.mem.sort(u8, list.items, {}, std.sort.asc(u8));
    return list.toOwnedSlice();
}

fn isAnagram(a: []const u8, b: []const u8) !bool {
    const na = try normalize(a);
    defer allocator.free(na);
    const nb = try normalize(b);
    defer allocator.free(nb);
    return std.mem.eql(u8, na, nb);
}

pub fn main() !void {
    std.debug.print("{}\n", .{try isAnagram("listen", "silent")});
    std.debug.print("{}\n", .{try isAnagram("hello", "world")});
}
