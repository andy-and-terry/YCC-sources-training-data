const std = @import("std");

fn fibonacci(n: usize) [11]i64 {
    var result: [11]i64 = undefined;
    var a: i64 = 0;
    var b: i64 = 1;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        result[i] = a;
        const temp = a + b;
        a = b;
        b = temp;
    }
    return result;
}

pub fn main() void {
    const result = fibonacci(11);
    std.debug.print("{any}\n", .{result});
}
