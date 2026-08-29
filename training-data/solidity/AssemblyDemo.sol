// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssemblyDemo {
    function addAssembly(uint256 a, uint256 b) external pure returns (uint256 result) {
        assembly {
            result := add(a, b)
        }
    }
}
