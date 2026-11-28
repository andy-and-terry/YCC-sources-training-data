const std = @import("std");

fn rail(i: usize, k: usize) usize {
    const cycle = 2 * (k - 1);
    const r = i % cycle;
    return if (r < k) r else cycle - r;
}

pub fn main() void {
    const text = "WEAREDISCOVERED";
    const k = 3;
    var out: [text.len]u8 = undefined;
    var p: usize = 0;
    for (0..k) |r| {
        for (text, 0..) |ch, i| {
            if (rail(i, k) == r) {
                out[p] = ch;
                p += 1;
            }
        }
    }
    std.debug.print("{s}\n", .{out});
}
