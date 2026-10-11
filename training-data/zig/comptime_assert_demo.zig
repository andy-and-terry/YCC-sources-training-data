const std = @import("std");

fn Matrix(comptime rows: usize, comptime cols: usize) type {
    comptime {
        if (rows == 0 or cols == 0) @compileError("matrix dimensions must be nonzero");
    }
    return struct {
        data: [rows][cols]i32 = [_][cols]i32{[_]i32{0} ** cols} ** rows,
        const Self = @This();
        fn trace(self: Self) i32 {
            var t: i32 = 0;
            for (0..@min(rows, cols)) |i| t += self.data[i][i];
            return t;
        }
    };
}

pub fn main() void {
    var m = Matrix(3, 3){};
    for (0..3) |i| m.data[i][i] = @intCast(i + 1);
    std.debug.print("trace = {d}\n", .{m.trace()});
}
