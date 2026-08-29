// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOperationsDemo {
    uint256[] public numbers;

    function addNumber(uint256 n) external {
        numbers.push(n);
    }

    function removeLast() external {
        numbers.pop();
    }

    function sum() external view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }

    function getAll() external view returns (uint256[] memory) {
        return numbers;
    }
}
