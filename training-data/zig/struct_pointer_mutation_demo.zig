const std = @import("std");

const Counter = struct {
    value: u32 = 0,

    fn increment(self: *Counter) void {
        self.value += 1;
    }

    fn get(self: Counter) u32 {
        return self.value;
    }
};

fn addTen(c: *Counter) void {
    c.value += 10;
}

pub fn main() void {
    var c = Counter{};
    c.increment();
    c.increment();
    addTen(&c);
    std.debug.print("value = {d}\n", .{c.get()});

    const p = &c;
    p.value = 100;
    std.debug.print("via pointer = {d}\n", .{c.value});
}
