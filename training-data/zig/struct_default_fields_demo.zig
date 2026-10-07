const std = @import("std");

const Config = struct {
    name: []const u8 = "unnamed",
    port: u16 = 8080,
    verbose: bool = false,
    retries: u8 = 3,

    fn describe(self: Config) void {
        std.debug.print("{s}:{d} verbose={} retries={d}\n", .{ self.name, self.port, self.verbose, self.retries });
    }
};

pub fn main() void {
    const defaults = Config{};
    defaults.describe();

    const custom = Config{ .name = "api", .port = 443 };
    custom.describe();

    // Copy with a single field changed
    var copy = custom;
    copy.verbose = true;
    copy.describe();
}
