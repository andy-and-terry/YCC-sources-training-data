const std = @import("std");

pub fn main() void {
    // A fixed seed gives the same sequence every run.
    var prng = std.Random.DefaultPrng.init(12345);
    const rand = prng.random();

    var rolls: [6]u8 = undefined;
    for (&rolls) |*r| {
        r.* = rand.intRangeAtMost(u8, 1, 6);
    }
    std.debug.print("rolls: {any}\n", .{rolls});

    // Shuffle a slice in place.
    var deck = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8 };
    rand.shuffle(u8, &deck);
    var sum: u32 = 0;
    for (deck) |c| sum += c;
    std.debug.print("shuffled sum is still {d}\n", .{sum});

    // Floats and booleans.
    const f = rand.float(f64);
    std.debug.print("float in [0,1): {}\n", .{f >= 0.0 and f < 1.0});
    std.debug.print("coin: {}\n", .{rand.boolean() or true});

    // Re-seeding reproduces the first value.
    var again = std.Random.DefaultPrng.init(12345);
    const first = again.random().intRangeAtMost(u8, 1, 6);
    std.debug.print("reproducible: {}\n", .{first == rolls[0]});
}
