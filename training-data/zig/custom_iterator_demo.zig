const std = @import("std");

const RangeIterator = struct {
    current: i32,
    end: i32,
    step: i32,

    fn next(self: *RangeIterator) ?i32 {
        if (self.current >= self.end) return null;
        const value = self.current;
        self.current += self.step;
        return value;
    }
};

pub fn main() void {
    var it = RangeIterator{ .current = 0, .end = 10, .step = 2 };
    while (it.next()) |value| {
        std.debug.print("{d}\n", .{value});
    }
}
