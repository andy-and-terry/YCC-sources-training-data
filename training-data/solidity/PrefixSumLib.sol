// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PrefixSumLib {
    function build(uint256[] memory values) internal pure returns (uint256[] memory prefix) {
        prefix = new uint256[](values.length + 1);
        for (uint256 i = 0; i < values.length; i++) {
            prefix[i + 1] = prefix[i] + values[i];
        }
    }

    // Sum of values[left..right), using a prefix array from build().
    function rangeSum(uint256[] memory prefix, uint256 left, uint256 right) internal pure returns (uint256) {
        require(left <= right && right < prefix.length, "bad range");
        return prefix[right] - prefix[left];
    }
}

contract PrefixSumDemo {
    function sumRange(uint256[] calldata values, uint256 left, uint256 right) external pure returns (uint256) {
        uint256[] memory prefix = PrefixSumLib.build(values);
        return PrefixSumLib.rangeSum(prefix, left, right);
    }
}
