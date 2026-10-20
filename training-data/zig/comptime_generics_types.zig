const std = @import("std");

fn Stack(comptime T: type, comptime capacity: usize) type {
    return struct {
        items: [capacity]T = undefined,
        len: usize = 0,

        const Self = @This();

        pub fn push(self: *Self, v: T) !void {
            if (self.len == capacity) return error.Full;
            self.items[self.len] = v;
            self.len += 1;
        }

        pub fn pop(self: *Self) ?T {
            if (self.len == 0) return null;
            self.len -= 1;
            return self.items[self.len];
        }
    };
}

fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

fn fib(comptime n: u32) u64 {
    return if (n < 2) n else fib(n - 1) + fib(n - 2);
}

pub fn main() !void {
    var s = Stack(i32, 2){};
    try s.push(1);
    try s.push(2);
    std.debug.print("{any} {?d}\n", .{ s.push(3), s.pop() });
    std.debug.print("{d} {d:.1}\n", .{ max(i32, 3, 9), max(f64, 2.5, 1.5) });
    const f20 = comptime fib(20);
    std.debug.print("{d}\n", .{f20});
    inline for (.{ 1, "two", 3.0 }) |x| std.debug.print("{any} ", .{@TypeOf(x)});
    std.debug.print("\n", .{});
}
