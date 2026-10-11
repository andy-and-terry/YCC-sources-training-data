// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library ReverseStringLib {
    function reverse(string memory s) internal pure returns (string memory) {
        bytes memory b = bytes(s);
        uint256 n = b.length;
        for (uint256 i = 0; i < n / 2; i++) {
            (b[i], b[n - 1 - i]) = (b[n - 1 - i], b[i]);
        }
        return string(b);
    }
}

contract ReverseStringDemo {
    function run(string calldata s) external pure returns (string memory) {
        return ReverseStringLib.reverse(s);
    }
}
