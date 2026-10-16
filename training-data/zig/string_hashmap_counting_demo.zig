const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var counts = std.AutoHashMap(u8, u32).init(allocator);
    defer counts.deinit();

    for ("mississippi") |c| {
        const gop = try counts.getOrPut(c);
        if (!gop.found_existing) gop.value_ptr.* = 0;
        gop.value_ptr.* += 1;
    }
    for ("imps") |c| {
        std.debug.print("{c}: {d}\n", .{ c, counts.get(c).? });
    }
}
