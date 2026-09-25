const std = @import("std");

fn Pair(comptime A: type, comptime B: type) type {
    return struct {
        first: A,
        second: B,

        const Self = @This();

        fn swap(self: Self) Pair(B, A) {
            return .{ .first = self.second, .second = self.first };
        }
    };
}

pub fn main() void {
    const p = Pair(i32, []const u8){ .first = 42, .second = "answer" };
    std.debug.print("{d} {s}\n", .{ p.first, p.second });

    const swapped = p.swap();
    std.debug.print("{s} {d}\n", .{ swapped.first, swapped.second });
}
