// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Square of the sum minus sum of squares for 1..10 (expect 2640)
contract SumSquareDifference {
    function difference(uint256 n) public pure returns (uint256) {
        uint256 sum;
        uint256 squares;
        for (uint256 i = 1; i <= n; i++) {
            sum += i;
            squares += i * i;
        }
        return sum * sum - squares;
    }
}
