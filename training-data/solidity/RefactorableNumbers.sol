// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RefactorableNumbers {
    function tau(uint256 n) public pure returns (uint256 c) {
        for (uint256 d = 1; d <= n; d++) if (n % d == 0) c++;
    }

    // isRefactorable(12) == true, isRefactorable(10) == false
    function isRefactorable(uint256 n) external pure returns (bool) {
        return n > 0 && n % tau(n) == 0;
    }
}
