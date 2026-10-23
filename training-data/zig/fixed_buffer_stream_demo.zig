const std = @import("std");

pub fn main() !void {
    var storage: [64]u8 = undefined;
    var stream = std.io.fixedBufferStream(&storage);
    const writer = stream.writer();

    try writer.print("x={d}, y={d}\n", .{ 3, 4 });
    try writer.writeAll("name: zig\n");
    try writer.writeByte('!');

    const written = stream.getWritten();
    std.debug.print("wrote {d} bytes:\n{s}\n", .{ written.len, written });

    // Read it back line by line.
    var reader_stream = std.io.fixedBufferStream(written);
    const reader = reader_stream.reader();
    var line_buf: [32]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&line_buf, '\n')) |line| {
        std.debug.print("line ({d}): {s}\n", .{ line.len, line });
    }

    // Writing past capacity returns an error.
    stream.reset();
    var big: [80]u8 = [_]u8{'a'} ** 80;
    stream.writer().writeAll(&big) catch |err| {
        std.debug.print("overflow: {s}\n", .{@errorName(err)});
    };
}
