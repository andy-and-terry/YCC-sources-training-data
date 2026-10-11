// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ErrorPanicCodesDemo {
    uint256[] private arr = [1, 2, 3];

    function divide(uint256 a, uint256 b) external pure returns (uint256) {
        return a / b; // Panic(0x12)
    }

    function index(uint256 i) external view returns (uint256) {
        return arr[i]; // Panic(0x32)
    }

    function popEmpty() external {
        while (arr.length > 0) arr.pop();
        arr.pop(); // Panic(0x31)
    }

    function assertFails() external pure {
        assert(1 == 2); // Panic(0x01)
    }
}
