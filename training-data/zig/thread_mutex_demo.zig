const std = @import("std");

const Counter = struct {
    mutex: std.Thread.Mutex = .{},
    value: u64 = 0,

    fn increment(self: *Counter) void {
        self.mutex.lock();
        defer self.mutex.unlock();
        self.value += 1;
    }
};

fn worker(counter: *Counter, times: usize) void {
    for (0..times) |_| {
        counter.increment();
    }
}

pub fn main() !void {
    var counter = Counter{};
    var threads: [4]std.Thread = undefined;

    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, worker, .{ &counter, 1000 });
    }
    for (threads) |t| {
        t.join();
    }

    std.debug.print("final count: {d}\n", .{counter.value});

    var atomic = std.atomic.Value(u32).init(0);
    _ = atomic.fetchAdd(5, .monotonic);
    _ = atomic.fetchAdd(2, .monotonic);
    std.debug.print("atomic: {d}\n", .{atomic.load(.monotonic)});
}
