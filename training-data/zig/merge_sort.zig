const std = @import("std");
const allocator = std.heap.page_allocator;

fn merge(items: []i32, mid: usize, allo: std.mem.Allocator) !void {
    const left = try allo.dupe(i32, items[0..mid]);
    defer allo.free(left);
    const right = try allo.dupe(i32, items[mid..]);
    defer allo.free(right);

    var i: usize = 0;
    var j: usize = 0;
    var k: usize = 0;
    while (i < left.len and j < right.len) {
        if (left[i] <= right[j]) {
            items[k] = left[i];
            i += 1;
        } else {
            items[k] = right[j];
            j += 1;
        }
        k += 1;
    }
    while (i < left.len) {
        items[k] = left[i];
        i += 1;
        k += 1;
    }
    while (j < right.len) {
        items[k] = right[j];
        j += 1;
        k += 1;
    }
}

fn mergeSort(items: []i32, allo: std.mem.Allocator) !void {
    if (items.len <= 1) return;
    const mid = items.len / 2;
    try mergeSort(items[0..mid], allo);
    try mergeSort(items[mid..], allo);
    try merge(items, mid, allo);
}

pub fn main() !void {
    var data = [_]i32{ 5, 2, 9, 1, 5, 6 };
    try mergeSort(&data, allocator);
    std.debug.print("{any}\n", .{data});
}
