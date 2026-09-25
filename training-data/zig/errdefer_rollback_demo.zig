const std = @import("std");
const allocator = std.heap.page_allocator;

const ResourceError = error{SetupFailed};

const Session = struct {
    buffer: []u8,
    label: []u8,
};

fn openSession(fail: bool) !Session {
    const buffer = try allocator.alloc(u8, 16);
    errdefer allocator.free(buffer);
    @memset(buffer, 0);

    const label = try allocator.alloc(u8, 8);
    errdefer allocator.free(label);
    @memset(label, 'x');

    if (fail) return ResourceError.SetupFailed;

    return Session{ .buffer = buffer, .label = label };
}

pub fn main() !void {
    if (openSession(true)) |session| {
        _ = session;
        std.debug.print("unexpected success\n", .{});
    } else |err| {
        std.debug.print("setup failed as expected: {}\n", .{err});
    }

    const session = try openSession(false);
    defer allocator.free(session.buffer);
    defer allocator.free(session.label);
    std.debug.print("session ready, buffer len = {d}\n", .{session.buffer.len});
}
