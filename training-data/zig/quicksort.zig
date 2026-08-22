const std = @import("std");

fn quicksort(items: []i32) void {
    if (items.len <= 1) return;
    const pivot = items[items.len / 2];
    var i: usize = 0;
    var j: usize = items.len - 1;
    while (i <= j) {
        while (items[i] < pivot) i += 1;
        while (items[j] > pivot) j -= 1;
        if (i <= j) {
            const tmp = items[i];
            items[i] = items[j];
            items[j] = tmp;
            i += 1;
            if (j == 0) break;
            j -= 1;
        }
    }
    if (j > 0) quicksort(items[0 .. j + 1]);
    if (i < items.len) quicksort(items[i..]);
}

pub fn main() void {
    var data = [_]i32{ 5, 3, 8, 1, 9, 2 };
    quicksort(&data);
    std.debug.print("{any}\n", .{data});
}
