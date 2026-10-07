const std = @import("std");

const EuclidResult = struct { gcd: i64, x: i64, y: i64 };

fn extendedEuclidean(a: i64, b: i64) EuclidResult {
    if (b == 0) return EuclidResult{ .gcd = a, .x = 1, .y = 0 };
    const sub = extendedEuclidean(b, @mod(a, b));
    const x = sub.y;
    const y = sub.x - @divFloor(a, b) * sub.y;
    return EuclidResult{ .gcd = sub.gcd, .x = x, .y = y };
}

pub fn main() void {
    const r1 = extendedEuclidean(30, 20);
    std.debug.print("{d} {d} {d}\n", .{ r1.gcd, r1.x, r1.y });
    const r2 = extendedEuclidean(35, 15);
    std.debug.print("{d} {d} {d}\n", .{ r2.gcd, r2.x, r2.y });
}
