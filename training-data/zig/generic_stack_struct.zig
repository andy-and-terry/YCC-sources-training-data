const std = @import("std");

fn Stack(comptime T: type) type {
    return struct {
        items: [16]T = undefined,
        len: usize = 0,
        const Self = @This();
        fn push(self: *Self, v: T) void { self.items[self.len] = v; self.len += 1; }
        fn pop(self: *Self) ?T {
            if (self.len == 0) return null;
            self.len -= 1;
            return self.items[self.len];
        }
    };
}

pub fn main() void {
    var s = Stack(i32){};
    s.push(1);
    s.push(2);
    std.debug.print("{?d}\n", .{s.pop()});
}
