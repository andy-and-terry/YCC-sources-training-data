const std = @import("std");

fn isValid(s: []const u8) bool {
    var stack: [100]u8 = undefined;
    var top: usize = 0;
    for (s) |c| {
        switch (c) {
            '(', '[', '{' => {
                stack[top] = c;
                top += 1;
            },
            ')', ']', '}' => {
                if (top == 0) return false;
                top -= 1;
                const expected: u8 = switch (c) {
                    ')' => '(',
                    ']' => '[',
                    else => '{',
                };
                if (stack[top] != expected) return false;
            },
            else => {},
        }
    }
    return top == 0;
}

pub fn main() void {
    std.debug.print("{}\n", .{isValid("{[()]}")});
    std.debug.print("{}\n", .{isValid("{[(])}")});
}
