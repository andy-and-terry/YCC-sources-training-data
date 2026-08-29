const std = @import("std");

pub fn main() void {
    var i: i32 = 1;
    while (i <= 20) : (i += 1) {
        if (@rem(i, 15) == 0) {
            std.debug.print("FizzBuzz\n", .{});
        } else if (@rem(i, 3) == 0) {
            std.debug.print("Fizz\n", .{});
        } else if (@rem(i, 5) == 0) {
            std.debug.print("Buzz\n", .{});
        } else {
            std.debug.print("{d}\n", .{i});
        }
    }
}
