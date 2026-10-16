const std = @import("std");

fn RingBuffer(comptime T: type, comptime N: usize) type {
    return struct {
        buf: [N]T = undefined,
        head: usize = 0,
        len: usize = 0,
        const Self = @This();

        fn push(self: *Self, v: T) void {
            const idx = (self.head + self.len) % N;
            if (self.len == N) {
                self.buf[self.head] = v;
                self.head = (self.head + 1) % N;
            } else {
                self.buf[idx] = v;
                self.len += 1;
            }
        }

        fn pop(self: *Self) ?T {
            if (self.len == 0) return null;
            const v = self.buf[self.head];
            self.head = (self.head + 1) % N;
            self.len -= 1;
            return v;
        }
    };
}

pub fn main() void {
    var rb = RingBuffer(u8, 3){};
    for ([_]u8{ 1, 2, 3, 4, 5 }) |v| rb.push(v);
    while (rb.pop()) |v| std.debug.print("{d} ", .{v});
    std.debug.print("\n", .{});
}
