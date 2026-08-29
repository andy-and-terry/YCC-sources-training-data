const std = @import("std");

fn insertionSort(items: []i32) void {
    var i: usize = 1;
    while (i < items.len) : (i += 1) {
        const key = items[i];
        var j: i64 = @as(i64, @intCast(i)) - 1;
        while (j >= 0 and items[@intCast(j)] > key) {
            items[@intCast(j + 1)] = items[@intCast(j)];
            j -= 1;
        }
        items[@intCast(j + 1)] = key;
    }
}

pub fn main() void {
    var data = [_]i32{ 12, 11, 13, 5, 6 };
    insertionSort(&data);
    std.debug.print("{any}\n", .{data});
}
