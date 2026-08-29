const std = @import("std");

fn isLeapYear(year: i32) bool {
    return (@rem(year, 4) == 0 and @rem(year, 100) != 0) or @rem(year, 400) == 0;
}

pub fn main() void {
    std.debug.print("{}\n", .{isLeapYear(2000)});
    std.debug.print("{}\n", .{isLeapYear(1900)});
    std.debug.print("{}\n", .{isLeapYear(2024)});
}
