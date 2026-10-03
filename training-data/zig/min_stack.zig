const std = @import("std");

// A stack that reports its minimum element in O(1) by tracking, for
// each slot, the minimum seen from the bottom of the stack up to it.
const MinStack = struct {
    values: [8]i32 = undefined,
    mins: [8]i32 = undefined,
    top: i32 = -1,

    fn push(self: *MinStack, value: i32) void {
        self.top += 1;
        const i: usize = @intCast(self.top);
        self.values[i] = value;
        self.mins[i] = if (i == 0) value else @min(value, self.mins[i - 1]);
    }

    fn pop(self: *MinStack) i32 {
        const i: usize = @intCast(self.top);
        self.top -= 1;
        return self.values[i];
    }

    fn getMin(self: *const MinStack) i32 {
        return self.mins[@intCast(self.top)];
    }
};

pub fn main() void {
    var stack = MinStack{};
    stack.push(5);
    stack.push(2);
    stack.push(8);
    std.debug.print("{d}\n", .{stack.getMin()});
    _ = stack.pop();
    stack.push(1);
    std.debug.print("{d}\n", .{stack.getMin()});
}
