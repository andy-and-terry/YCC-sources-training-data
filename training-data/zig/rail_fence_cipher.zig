const std = @import("std");

pub fn main() void {
    const s = "WEAREDISCOVERED";
    var rail_of: [s.len]usize = undefined;
    var r: usize = 0;
    var down = true;
    for (0..s.len) |i| {
        rail_of[i] = r;
        if (r == 0) down = true;
        if (r == 2) down = false;
        if (down) r += 1 else r -= 1;
    }
    for (0..3) |rail| {
        for (0..s.len) |i| {
            if (rail_of[i] == rail) std.debug.print("{c}", .{s[i]});
        }
    }
    std.debug.print("\n", .{});
}
