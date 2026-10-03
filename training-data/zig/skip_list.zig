const std = @import("std");

// A simplified skip list: an express lane that skips by a fixed
// stride over a sorted base array, falling back to a linear scan
// within the located block.
const SkipList = struct {
    base: []const i32,
    stride: usize,

    fn search(self: SkipList, target: i32) ?usize {
        var block_start: usize = 0;
        var i: usize = 0;
        while (i < self.base.len) : (i += self.stride) {
            if (self.base[i] > target) break;
            block_start = i;
        }

        const limit = @min(self.base.len, block_start + self.stride);
        var j = block_start;
        while (j < limit) : (j += 1) {
            if (self.base[j] == target) return j;
        }
        return null;
    }
};

pub fn main() void {
    const base = [_]i32{ 2, 4, 7, 9, 12, 15, 19, 22, 26, 30 };
    const sl = SkipList{ .base = &base, .stride = 3 };

    std.debug.print("{any}\n", .{sl.search(19)});
    std.debug.print("{any}\n", .{sl.search(13)});
}
