const std = @import("std");

pub fn main() !void {
    var buf: [64]u8 = undefined;

    const a = try std.fmt.bufPrint(&buf, "{d} + {d} = {d}", .{ 2, 3, 5 });
    std.debug.print("{s} (len {d})\n", .{ a, a.len });

    const b = try std.fmt.bufPrint(&buf, "{x:0>4}|{b:0>8}|{o}", .{ 255, 5, 64 });
    std.debug.print("{s}\n", .{b});

    const c = try std.fmt.bufPrint(&buf, "[{s:>8}] [{s:<8}] [{s:^8}]", .{ "right", "left", "mid" });
    std.debug.print("{s}\n", .{c});

    const d = try std.fmt.bufPrint(&buf, "{d:.3} {e}", .{ 3.14159, 1234.5 });
    std.debug.print("{s}\n", .{d});

    var tiny: [4]u8 = undefined;
    if (std.fmt.bufPrint(&tiny, "{s}", .{"too long for buffer"})) |_| {
        std.debug.print("fit\n", .{});
    } else |err| {
        std.debug.print("error: {s}\n", .{@errorName(err)});
    }

    const n = std.fmt.count("{d}-{d}", .{ 1000, 2000 });
    std.debug.print("needs {d} bytes\n", .{n});
}
