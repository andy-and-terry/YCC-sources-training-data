const std = @import("std");

// Boyer-Moore majority vote: finds the element appearing more than
// n/2 times in a single linear pass, verifying the candidate with a
// second pass.
fn majorityElement(arr: []const i32) ?i32 {
    var candidate: i32 = 0;
    var count: i32 = 0;
    for (arr) |v| {
        if (count == 0) {
            candidate = v;
            count = 1;
        } else if (v == candidate) {
            count += 1;
        } else {
            count -= 1;
        }
    }

    var occurrences: usize = 0;
    for (arr) |v| {
        if (v == candidate) occurrences += 1;
    }
    if (occurrences * 2 > arr.len) return candidate;
    return null;
}

pub fn main() void {
    const a = [_]i32{ 2, 2, 1, 1, 1, 2, 2 };
    const b = [_]i32{ 1, 2, 3, 4 };
    std.debug.print("{any}\n", .{majorityElement(&a)});
    std.debug.print("{any}\n", .{majorityElement(&b)});
}
