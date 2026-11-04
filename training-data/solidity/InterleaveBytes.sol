// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InterleaveBytes {
    function interleave(string calldata a, string calldata b) external pure returns (string memory) {
        bytes memory x = bytes(a);
        bytes memory y = bytes(b);
        uint256 longest = x.length > y.length ? x.length : y.length;
        bytes memory out = new bytes(x.length + y.length);
        uint256 k;
        for (uint256 i = 0; i < longest; i++) {
            if (i < x.length) out[k++] = x[i];
            if (i < y.length) out[k++] = y[i];
        }
        return string(out);
    }
}
