const std = @import("std");

fn selectionSort(items: []i32) void {
    var i: usize = 0;
    while (i < items.len - 1) : (i += 1) {
        var minIdx = i;
        var j: usize = i + 1;
        while (j < items.len) : (j += 1) {
            if (items[j] < items[minIdx]) minIdx = j;
        }
        const tmp = items[i];
        items[i] = items[minIdx];
        items[minIdx] = tmp;
    }
}

pub fn main() void {
    var data = [_]i32{ 5, 3, 8, 1, 9, 2 };
    selectionSort(&data);
    std.debug.print("{any}\n", .{data});
}
