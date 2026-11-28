// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SierpinskiRow {
    function row(uint256 r) public pure returns (string memory) {
        bytes memory out = new bytes(2 * (r + 1));
        for (uint256 c = 0; c <= r; c++) {
            out[2 * c] = (r & c) == c ? bytes1("*") : bytes1(" ");
            out[2 * c + 1] = " ";
        }
        return string(out);
    }
}
