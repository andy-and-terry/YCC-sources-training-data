// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Array-backed binary min-heap: the smallest value is always at the
// root and can be inspected or removed in O(log n).
library PriorityQueueLib {
    struct Heap {
        uint256[] items;
    }

    function insert(Heap storage heap, uint256 value) internal {
        heap.items.push(value);
        uint256 i = heap.items.length - 1;
        while (i > 0) {
            uint256 parent = (i - 1) / 2;
            if (heap.items[parent] <= heap.items[i]) break;
            (heap.items[parent], heap.items[i]) = (heap.items[i], heap.items[parent]);
            i = parent;
        }
    }

    function extractMin(Heap storage heap) internal returns (uint256 min) {
        require(heap.items.length > 0, "heap is empty");
        min = heap.items[0];
        uint256 last = heap.items.length - 1;
        heap.items[0] = heap.items[last];
        heap.items.pop();

        uint256 i = 0;
        uint256 len = heap.items.length;
        while (true) {
            uint256 left = 2 * i + 1;
            uint256 right = 2 * i + 2;
            uint256 smallest = i;
            if (left < len && heap.items[left] < heap.items[smallest]) smallest = left;
            if (right < len && heap.items[right] < heap.items[smallest]) smallest = right;
            if (smallest == i) break;
            (heap.items[i], heap.items[smallest]) = (heap.items[smallest], heap.items[i]);
            i = smallest;
        }
    }

    function peek(Heap storage heap) internal view returns (uint256) {
        require(heap.items.length > 0, "heap is empty");
        return heap.items[0];
    }

    function size(Heap storage heap) internal view returns (uint256) {
        return heap.items.length;
    }
}

contract PriorityQueueDemo {
    using PriorityQueueLib for PriorityQueueLib.Heap;

    PriorityQueueLib.Heap private heap;

    function insert(uint256 value) external {
        heap.insert(value);
    }

    function extractMin() external returns (uint256) {
        return heap.extractMin();
    }

    function peek() external view returns (uint256) {
        return heap.peek();
    }

    function size() external view returns (uint256) {
        return heap.size();
    }
}
