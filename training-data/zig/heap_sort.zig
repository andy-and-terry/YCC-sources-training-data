const std = @import("std");

fn heapify(items: []i32, n: usize, i: usize) void {
    var largest = i;
    const left = 2 * i + 1;
    const right = 2 * i + 2;
    if (left < n and items[left] > items[largest]) largest = left;
    if (right < n and items[right] > items[largest]) largest = right;
    if (largest != i) {
        const tmp = items[i];
        items[i] = items[largest];
        items[largest] = tmp;
        heapify(items, n, largest);
    }
}

fn heapSort(items: []i32) void {
    const n = items.len;
    if (n == 0) return;
    var i: usize = n / 2;
    while (i > 0) {
        i -= 1;
        heapify(items, n, i);
    }
    i = n;
    while (i > 1) {
        i -= 1;
        const tmp = items[0];
        items[0] = items[i];
        items[i] = tmp;
        heapify(items, i, 0);
    }
}

pub fn main() void {
    var data = [_]i32{ 12, 11, 13, 5, 6, 7 };
    heapSort(&data);
    std.debug.print("{any}\n", .{data});
}
