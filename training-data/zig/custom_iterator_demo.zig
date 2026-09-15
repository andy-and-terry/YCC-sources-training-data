const std = @import("std");

const RangeIter = struct {
    current: i32,
    end: i32,

    fn next(self: *RangeIter) ?i32 {
        if (self.current >= self.end) return null;
        const value = self.current;
        self.current += 1;
        return value;
    }
};

pub fn main() void {
    var it = RangeIter{ .current = 0, .end = 5 };
    var sum: i32 = 0;
    while (it.next()) |value| {
        sum += value;
    }
    std.debug.print("{d}\n", .{sum});

    var it2 = RangeIter{ .current = 10, .end = 13 };
    while (it2.next()) |value| {
        std.debug.print("{d}\n", .{value});
    }
}
