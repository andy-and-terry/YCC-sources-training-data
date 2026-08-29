const std = @import("std");

fn isArmstrong(n: i32) bool {
    var buffer: [10]u8 = undefined;
    const digits_str = std.fmt.bufPrint(&buffer, "{d}", .{n}) catch unreachable;
    const power: u32 = @intCast(digits_str.len);
    var total: i64 = 0;
    for (digits_str) |c| {
        const d: i64 = c - '0';
        total += std.math.pow(i64, d, power);
    }
    return total == n;
}

pub fn main() void {
    std.debug.print("{}\n", .{isArmstrong(153)});
    std.debug.print("{}\n", .{isArmstrong(154)});
}
