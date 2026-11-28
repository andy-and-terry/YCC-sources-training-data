const std = @import("std");

pub fn main() void {
    const text = "WEAREDISCOVERED";
    const rails: usize = 3;
    var out: [text.len]u8 = undefined;
    var k: usize = 0;
    var row: usize = 0;
    while (row < rails) : (row += 1) {
        var r: usize = 0;
        var down = true;
        for (text) |ch| {
            if (r == row) {
                out[k] = ch;
                k += 1;
            }
            if (r == 0) down = true else if (r == rails - 1) down = false;
            r = if (down) r + 1 else r - 1;
        }
    }
    std.debug.print("{s}\n", .{out});
}
