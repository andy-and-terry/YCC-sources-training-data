const std = @import("std");

const Player = struct {
    name: []const u8,
    score: i32,
};

fn byScoreDesc(context: void, a: Player, b: Player) bool {
    _ = context;
    return a.score > b.score;
}

pub fn main() void {
    var players = [_]Player{
        .{ .name = "alice", .score = 42 },
        .{ .name = "bob", .score = 91 },
        .{ .name = "carol", .score = 67 },
    };

    std.mem.sort(Player, &players, {}, byScoreDesc);

    for (players) |p| {
        std.debug.print("{s}: {d}\n", .{ p.name, p.score });
    }
}
