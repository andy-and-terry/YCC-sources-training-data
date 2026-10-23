const std = @import("std");

fn makeBuffer(allocator: std.mem.Allocator, n: usize, fail: bool) ![]u8 {
    const buf = try allocator.alloc(u8, n);
    errdefer allocator.free(buf);

    @memset(buf, 'x');
    if (fail) return error.Unlucky;
    return buf;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa.deinit() == .ok);
    const allocator = gpa.allocator();

    const ok = try makeBuffer(allocator, 4, false);
    defer allocator.free(ok);
    std.debug.print("{s}\n", .{ok});

    if (makeBuffer(allocator, 4, true)) |b| {
        allocator.free(b);
    } else |err| {
        std.debug.print("failed: {s}\n", .{@errorName(err)});
    }
}
