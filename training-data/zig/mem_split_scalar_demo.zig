const std = @import("std");

pub fn main() void {
    var it = std.mem.splitScalar(u8, "a,b,,c", ',');
    var n: usize = 0;
    while (it.next()) |part| : (n += 1) {
        std.debug.print("{d}: '{s}'\n", .{ n, part });
    }
    var lines = std.mem.splitSequence(u8, "one::two::three", "::");
    while (lines.next()) |p| std.debug.print("{s}\n", .{p});
    var rest = std.mem.splitScalar(u8, "k=v=w", '=');
    _ = rest.next();
    std.debug.print("rest: {s}\n", .{rest.rest()});
}
