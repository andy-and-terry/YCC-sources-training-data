// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A fixed-size range-sum segment tree over on-chain storage, supporting
// point updates and O(log n) range-sum queries.
contract SegmentTreeDemo {
    uint256 public n;
    uint256[] public tree;

    constructor(uint256[] memory values) {
        n = values.length;
        tree = new uint256[](2 * n);
        for (uint256 i = 0; i < n; i++) {
            tree[n + i] = values[i];
        }
        for (uint256 i = n; i > 0; i--) {
            tree[i - 1] = tree[2 * (i - 1)] + tree[2 * (i - 1) + 1];
        }
    }

    function update(uint256 pos, uint256 value) external {
        uint256 i = pos + n;
        tree[i] = value;
        while (i > 1) {
            i /= 2;
            tree[i] = tree[2 * i] + tree[2 * i + 1];
        }
    }

    function query(uint256 left, uint256 right) external view returns (uint256 sum) {
        uint256 l = left + n;
        uint256 r = right + n;
        while (l < r) {
            if (l % 2 == 1) {
                sum += tree[l];
                l++;
            }
            if (r % 2 == 1) {
                r--;
                sum += tree[r];
            }
            l /= 2;
            r /= 2;
        }
    }
}
