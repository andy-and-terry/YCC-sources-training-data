const std = @import("std");

fn square(x: i32) i32 {
    return x * x;
}

test "square works" {
    try std.testing.expectEqual(@as(i32, 49), square(7));
    try std.testing.expect(square(-3) == 9);
}
