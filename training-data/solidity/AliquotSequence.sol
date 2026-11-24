// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Aliquot sequence: replace n by the sum of its proper divisors.
contract AliquotSequence {
    function aliquotSum(uint256 n) public pure returns (uint256 s) {
        for (uint256 d = 1; d <= n / 2; d++) if (n % d == 0) s += d;
    }

    // Steps needed to reach 1 starting from n (bounded by maxSteps).
    function stepsToOne(uint256 n, uint256 maxSteps) public pure returns (uint256 steps) {
        while (n > 1 && steps < maxSteps) {
            n = aliquotSum(n);
            steps++;
        }
    }
}
