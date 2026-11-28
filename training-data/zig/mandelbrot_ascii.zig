const std = @import("std");

fn escape(cr: f64, ci: f64) u32 {
    var zr: f64 = 0;
    var zi: f64 = 0;
    var n: u32 = 0;
    while (n < 30 and zr * zr + zi * zi < 4) : (n += 1) {
        const t = zr * zr - zi * zi + cr;
        zi = 2 * zr * zi + ci;
        zr = t;
    }
    return n;
}

pub fn main() void {
    var yi: i32 = -5;
    while (yi <= 5) : (yi += 1) {
        var xi: i32 = -40;
        while (xi <= 12) : (xi += 1) {
            const n = escape(@as(f64, @floatFromInt(xi)) / 20, @as(f64, @floatFromInt(yi)) / 5);
            std.debug.print("{c}", .{@as(u8, if (n == 30) '#' else '.')});
        }
        std.debug.print("\n", .{});
    }
}
