const std = @import("std");

fn zigzag(allocator: std.mem.Allocator, s: []const u8, rows: usize) ![]u8 {
    if (rows == 1 or rows >= s.len) return allocator.dupe(u8, s);
    var out = try allocator.alloc(u8, s.len);
    var k: usize = 0;
    const period = 2 * (rows - 1);
    for (0..rows) |r| {
        var i: usize = r;
        while (i < s.len) : (i += period) {
            out[k] = s[i];
            k += 1;
            const diag = i + period - 2 * r;
            if (r > 0 and r < rows - 1 and diag < s.len) {
                out[k] = s[diag];
                k += 1;
            }
        }
    }
    return out;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const out = try zigzag(gpa.allocator(), "PAYPALISHIRING", 3);
    defer gpa.allocator().free(out);
    std.debug.print("{s}\n", .{out});
}
