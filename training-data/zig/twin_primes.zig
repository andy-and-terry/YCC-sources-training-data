const std = @import("std");

pub fn main() void {
    const limit = 80;
    var composite = [_]bool{false} ** (limit + 1);
    var i: usize = 2;
    while (i * i <= limit) : (i += 1) {
        if (!composite[i]) {
            var j = i * i;
            while (j <= limit) : (j += i) composite[j] = true;
        }
    }
    var p: usize = 3;
    while (p + 2 <= limit) : (p += 1) {
        if (!composite[p] and !composite[p + 2]) std.debug.print("({d},{d}) ", .{ p, p + 2 });
    }
    std.debug.print("\n", .{}); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
