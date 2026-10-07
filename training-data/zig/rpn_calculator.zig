const std = @import("std");

const EvalError = error{ StackUnderflow, UnknownToken, DivideByZero };

fn evalRpn(expr: []const u8) EvalError!i64 {
    var stack: [32]i64 = undefined;
    var sp: usize = 0;

    var it = std.mem.tokenizeScalar(u8, expr, ' ');
    while (it.next()) |tok| {
        if (std.fmt.parseInt(i64, tok, 10)) |n| {
            stack[sp] = n;
            sp += 1;
            continue;
        } else |_| {}

        if (tok.len != 1) return error.UnknownToken;
        if (sp < 2) return error.StackUnderflow;
        const b = stack[sp - 1];
        const a = stack[sp - 2];
        sp -= 2;
        const r: i64 = switch (tok[0]) {
            '+' => a + b,
            '-' => a - b,
            '*' => a * b,
            '/' => if (b == 0) return error.DivideByZero else @divTrunc(a, b),
            else => return error.UnknownToken,
        };
        stack[sp] = r;
        sp += 1;
    }
    if (sp != 1) return error.StackUnderflow;
    return stack[0];
}

pub fn main() void {
    std.debug.print("{!d}\n", .{evalRpn("3 4 + 2 *")});
    std.debug.print("{!d}\n", .{evalRpn("5 1 2 + 4 * + 3 -")});
    std.debug.print("{!d}\n", .{evalRpn("1 0 /")});
}
