const std = @import("std");

const Shared = struct {
    mutex: std.Thread.Mutex = .{},
    counter: u64 = 0,
};

fn worker(shared: *Shared, iterations: u32) void {
    var i: u32 = 0;
    while (i < iterations) : (i += 1) {
        shared.mutex.lock();
        defer shared.mutex.unlock();
        shared.counter += 1;
    }
}

pub fn main() !void {
    var shared = Shared{};
    var threads: [4]std.Thread = undefined;

    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, worker, .{ &shared, 1000 });
    }
    for (threads) |t| {
        t.join();
    }

    std.debug.print("counter = {d}\n", .{shared.counter});
}
