const std = @import("std");

fn MinStack(comptime T: type, comptime cap: usize) type {
    return struct {
        const Self = @This();
        vals: [cap]T = undefined,
        mins: [cap]T = undefined,
        len: usize = 0,

        fn push(self: *Self, x: T) void {
            self.mins[self.len] = if (self.len > 0) @min(x, self.mins[self.len - 1]) else x;
            self.vals[self.len] = x;
            self.len += 1;
        }
        fn pop(self: *Self) T {
            self.len -= 1;
            return self.vals[self.len];
        }
        fn min(self: Self) T {
            return self.mins[self.len - 1];
        }
    };
}

pub fn main() void {
    var s = MinStack(i32, 16){};
    for ([_]i32{ 5, 3, 7, 2 }) |v| s.push(v);
    std.debug.print("{d}\n", .{s.min()});
    _ = s.pop();
    std.debug.print("{d}\n", .{s.min()});
}
