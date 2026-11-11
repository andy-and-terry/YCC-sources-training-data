// Bulls and Cows scoring for equal-length digit strings.
const std = @import("std");

const Score = struct { bulls: u32, cows: u32 };

fn score(secret: []const u8, guess: []const u8) Score {
    var bulls: u32 = 0;
    var sc = [_]u32{0} ** 10;
    var gc = [_]u32{0} ** 10;
    for (secret, guess) |s, g| {
        if (s == g) {
            bulls += 1;
        } else {
            sc[s - '0'] += 1;
            gc[g - '0'] += 1;
        }
    }
    var cows: u32 = 0;
    for (sc, gc) |a, b| cows += @min(a, b);
    return .{ .bulls = bulls, .cows = cows };
}

pub fn main() void {
    const r = score("1807", "7810");
    std.debug.print("{d} bull(s), {d} cow(s)\n", .{ r.bulls, r.cows });
}
