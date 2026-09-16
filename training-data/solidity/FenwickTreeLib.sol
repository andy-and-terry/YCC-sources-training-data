// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library FenwickTreeLib {
    function update(uint256[] memory tree, uint256 index, uint256 delta) internal pure {
        uint256 i = index + 1;
        while (i < tree.length) {
            tree[i] += delta;
            i += i & (~i + 1);
        }
    }

    function prefixSum(uint256[] memory tree, uint256 index) internal pure returns (uint256 sum) {
        uint256 i = index + 1;
        while (i > 0) {
            sum += tree[i];
            i -= i & (~i + 1);
        }
    }

    function rangeSum(uint256[] memory tree, uint256 low, uint256 high) internal pure returns (uint256) {
        uint256 upper = prefixSum(tree, high);
        uint256 lower = low == 0 ? 0 : prefixSum(tree, low - 1);
        return upper - lower;
    }
}
