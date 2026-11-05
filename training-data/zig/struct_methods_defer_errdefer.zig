const std = @import("std");

const Counter = struct {
    n: u32 = 0,
    fn bump(self: *Counter) void {
        self.n += 1;
    }
};

pub fn main() void {
    var c = Counter{};
    defer std.debug.print("final {}\n", .{c.n});
    c.bump();
    c.bump();
}
