const std = @import("std");

fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add works" {
    try std.testing.expect(add(2, 3) == 5);
    try std.testing.expectEqual(@as(i32, 0), add(-1, 1));
}
