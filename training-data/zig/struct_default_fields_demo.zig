const std = @import("std");

const Config = struct {
    host: []const u8 = "localhost",
    port: u16 = 8080,
    retries: u8 = 3,
    verbose: bool = false,

    fn describe(self: Config) void {
        std.debug.print("{s}:{d} retries={d} verbose={any}\n", .{ self.host, self.port, self.retries, self.verbose });
    }

    fn withPort(self: Config, port: u16) Config {
        var copy = self;
        copy.port = port;
        return copy;
    }
};

const Point = struct {
    x: i32 = 0,
    y: i32 = 0,

    const origin = Point{};

    fn add(a: Point, b: Point) Point {
        return .{ .x = a.x + b.x, .y = a.y + b.y };
    }
};

pub fn main() void {
    const defaults = Config{};
    defaults.describe();

    const custom = Config{ .host = "example.com", .verbose = true };
    custom.describe();

    custom.withPort(443).describe();

    const p = Point{ .x = 3 };
    const q = Point.add(p, .{ .y = 4 });
    std.debug.print("({d}, {d})\n", .{ q.x, q.y });
    std.debug.print("origin is ({d}, {d})\n", .{ Point.origin.x, Point.origin.y });

    const anon = .{ .name = "anon", .value = 42 };
    std.debug.print("{s} = {d}\n", .{ anon.name, anon.value });
}
