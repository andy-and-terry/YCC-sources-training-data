const std = @import("std");

fn describe(comptime T: type) []const u8 {
    return switch (@typeInfo(T)) {
        .Int => "integer",
        .Float => "float",
        .Bool => "bool",
        .Pointer => "pointer",
        .Array => "array",
        else => "other",
    };
}

pub fn main() void {
    std.debug.print("{s}\n", .{describe(u8)});
    std.debug.print("{s}\n", .{describe(f64)});
    std.debug.print("{s}\n", .{describe(bool)});
    std.debug.print("{s}\n", .{describe([4]u8)});
    std.debug.print("{s}\n", .{describe(*i32)});
    std.debug.print("{s}\n", .{describe(void)});
}
