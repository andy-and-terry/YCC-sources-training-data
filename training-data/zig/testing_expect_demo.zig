const std = @import("std");
const expect = std.testing.expect;
const expectEqual = std.testing.expectEqual;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn isEven(n: i32) bool {
    return @mod(n, 2) == 0;
}

test "add sums two integers" {
    try expectEqual(@as(i32, 7), add(3, 4));
}

test "isEven detects parity" {
    try expect(isEven(4));
    try expect(!isEven(5));
}

pub fn main() void {
    std.debug.print("{d}\n", .{add(3, 4)});
    std.debug.print("{}\n", .{isEven(4)});
}
