const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;

fn buildSquares(allocator: std.mem.Allocator, count: usize) ![]i32 {
    const result = try allocator.alloc(i32, count);
    for (result, 0..) |*value, i| {
        value.* = @as(i32, @intCast(i * i));
    }
    return result;
}

test "buildSquares allocates and frees without leaking" {
    const allocator = std.testing.allocator;
    const squares = try buildSquares(allocator, 5);
    defer allocator.free(squares);

    try expectEqualSlices(i32, &[_]i32{ 0, 1, 4, 9, 16 }, squares);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const squares = try buildSquares(allocator, 5);
    defer allocator.free(squares);
    std.debug.print("{any}\n", .{squares});
}
