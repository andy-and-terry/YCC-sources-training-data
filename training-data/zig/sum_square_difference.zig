// Square of the sum minus sum of squares for 1..10 (expect 2640)
const std = @import("std");

pub fn main() void {
    var sum: u32 = 0;
    var squares: u32 = 0;
    var i: u32 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
        squares += i * i;
    }
    std.debug.print("{d}\n", .{sum * sum - squares});
}
