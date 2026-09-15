// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice A binary min-heap over a storage array, usable as an
/// on-chain priority queue (e.g. for auction bids or task scheduling).
contract HeapLib {
    uint256[] private heap;

    function size() external view returns (uint256) {
        return heap.length;
    }

    function peekMin() external view returns (uint256) {
        require(heap.length > 0, "heap is empty");
        return heap[0];
    }

    function insert(uint256 value) external {
        heap.push(value);
        _siftUp(heap.length - 1);
    }

    function extractMin() external returns (uint256 minValue) {
        require(heap.length > 0, "heap is empty");
        minValue = heap[0];
        uint256 lastIndex = heap.length - 1;
        heap[0] = heap[lastIndex];
        heap.pop();
        if (heap.length > 0) {
            _siftDown(0);
        }
    }

    function _siftUp(uint256 i) private {
        while (i > 0) {
            uint256 parent = (i - 1) / 2;
            if (heap[i] >= heap[parent]) break;
            (heap[i], heap[parent]) = (heap[parent], heap[i]);
            i = parent;
        }
    }

    function _siftDown(uint256 i) private {
        uint256 n = heap.length;
        while (true) {
            uint256 left = 2 * i + 1;
            uint256 right = 2 * i + 2;
            uint256 smallest = i;

            if (left < n && heap[left] < heap[smallest]) smallest = left;
            if (right < n && heap[right] < heap[smallest]) smallest = right;
            if (smallest == i) break;

            (heap[i], heap[smallest]) = (heap[smallest], heap[i]);
            i = smallest;
        }
    }
}
