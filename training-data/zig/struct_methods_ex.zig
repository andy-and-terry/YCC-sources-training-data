const std = @import("std");

const Counter = struct {
    n: u32 = 0,

    pub fn inc(self: *Counter) void {
        self.n += 1;
    }
    pub fn get(self: Counter) u32 {
        return self.n;
    }
};

pub fn main() void {
    var c = Counter{};
    c.inc();
    c.inc();
    std.debug.print("{d}\n", .{c.get()});
}
