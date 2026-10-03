// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MinHeapDemo {
    uint256[] private heap;

    function size() external view returns (uint256) {
        return heap.length;
    }

    function insert(uint256 value) external {
        heap.push(value);
        uint256 i = heap.length - 1;
        while (i > 0) {
            uint256 parent = (i - 1) / 2;
            if (heap[parent] <= heap[i]) {
                break;
            }
            (heap[parent], heap[i]) = (heap[i], heap[parent]);
            i = parent;
        }
    }

    function extractMin() external returns (uint256) {
        require(heap.length > 0, "heap is empty");
        uint256 minValue = heap[0];
        uint256 last = heap.length - 1;
        heap[0] = heap[last];
        heap.pop();

        uint256 i = 0;
        uint256 len = heap.length;
        while (true) {
            uint256 left = 2 * i + 1;
            uint256 right = 2 * i + 2;
            uint256 smallest = i;

            if (left < len && heap[left] < heap[smallest]) {
                smallest = left;
            }
            if (right < len && heap[right] < heap[smallest]) {
                smallest = right;
            }
            if (smallest == i) {
                break;
            }
            (heap[i], heap[smallest]) = (heap[smallest], heap[i]);
            i = smallest;
        }

        return minValue;
    }
}
