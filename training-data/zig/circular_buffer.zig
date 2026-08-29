const std = @import("std");

const CircularBuffer = struct {
    data: [3]i32,
    size: usize,
    start: usize,

    fn init() CircularBuffer {
        return CircularBuffer{ .data = undefined, .size = 0, .start = 0 };
    }

    fn push(self: *CircularBuffer, value: i32) void {
        const index = (self.start + self.size) % self.data.len;
        self.data[index] = value;
        if (self.size < self.data.len) {
            self.size += 1;
        } else {
            self.start = (self.start + 1) % self.data.len;
        }
    }
};

pub fn main() void {
    var buf = CircularBuffer.init();
    const values = [_]i32{ 1, 2, 3, 4, 5 };
    for (values) |v| buf.push(v);
    std.debug.print("{any}\n", .{buf.data});
}
