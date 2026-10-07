#!/usr/bin/awk -f
# Min-priority queue backed by a binary heap stored in an array;
# size[0] simulates a mutable reference since awk passes arrays by reference.
function pq_push(heap, size, value,    i, parent, tmp) {
    size[0]++
    i = size[0]
    heap[i] = value
    while (i > 1) {
        parent = int(i / 2)
        if (heap[parent] <= heap[i]) break
        tmp = heap[parent]; heap[parent] = heap[i]; heap[i] = tmp
        i = parent
    }
}
function pq_pop(heap, size,    result, i, left, right, smallest, tmp) {
    result = heap[1]
    heap[1] = heap[size[0]]
    delete heap[size[0]]
    size[0]--
    i = 1
    while (1) {
        left = i * 2
        right = i * 2 + 1
        smallest = i
        if (left <= size[0] && heap[left] < heap[smallest]) smallest = left
        if (right <= size[0] && heap[right] < heap[smallest]) smallest = right
        if (smallest == i) break
        tmp = heap[i]; heap[i] = heap[smallest]; heap[smallest] = tmp
        i = smallest
    }
    return result
}
BEGIN {
    size[0] = 0
    n = split("5 2 9 1 5 6 3", nums, " ")
    for (i = 1; i <= n; i++) pq_push(heap, size, nums[i])
    while (size[0] > 0) {
        printf "%s ", pq_pop(heap, size)
    }
    print ""
}
