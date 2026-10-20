const std = @import("std");

pub fn main() !void {
    const s = "Hello, World";
    std.debug.print("{d} {s} {s}\n", .{ s.len, s[7..], s[0..5] });
    std.debug.print("{any} {any}\n", .{ std.mem.indexOf(u8, s, "World"), std.mem.startsWith(u8, s, "Hell") });
    std.debug.print("{s}\n", .{std.mem.trim(u8, "  pad  ", " ")});
    var it = std.mem.splitScalar(u8, "a,b,,c", ',');
    while (it.next()) |part| std.debug.print("[{s}]", .{part});
    std.debug.print("\n", .{});
    var buf: [16]u8 = undefined;
    const up = std.ascii.upperString(&buf, "shout");
    std.debug.print("{s} {any}\n", .{ up, std.mem.eql(u8, up, "SHOUT") });
    const utf8 = "héllo";
    var view = try std.unicode.Utf8View.init(utf8);
    var count: usize = 0;
    var cps = view.iterator();
    while (cps.nextCodepoint()) |_| count += 1;
    std.debug.print("{d} bytes {d} codepoints\n", .{ utf8.len, count });
    var arr = [_]i32{ 5, 2, 9, 1 };
    std.mem.sort(i32, &arr, {}, std.sort.asc(i32));
    std.debug.print("{any} {d}\n", .{ arr, std.mem.indexOfScalar(i32, &arr, 9).? });
    std.mem.reverse(i32, &arr);
    std.debug.print("{any}\n", .{arr});
}
