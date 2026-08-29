const std = @import("std");
const allocator = std.heap.page_allocator;

fn isPalindrome(s: []const u8) !bool {
    var normalized = std.ArrayList(u8).init(allocator);
    defer normalized.deinit();
    for (s) |c| {
        const lower = std.ascii.toLower(c);
        if (std.ascii.isAlphanumeric(lower)) {
            try normalized.append(lower);
        }
    }
    var i: usize = 0;
    var j: usize = normalized.items.len;
    if (j == 0) return true;
    j -= 1;
    while (i < j) {
        if (normalized.items[i] != normalized.items[j]) return false;
        i += 1;
        j -= 1;
    }
    return true;
}

pub fn main() !void {
    std.debug.print("{}\n", .{try isPalindrome("A man, a plan, a canal: Panama")});
    std.debug.print("{}\n", .{try isPalindrome("hello")});
}
