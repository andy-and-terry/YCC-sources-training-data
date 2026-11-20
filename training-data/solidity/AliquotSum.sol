// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AliquotSum {
    enum Kind { Deficient, Perfect, Abundant }

    function aliquot(uint256 n) public pure returns (uint256 s) {
        for (uint256 d = 1; d < n; d++) if (n % d == 0) s += d;
    }

    function classify(uint256 n) public pure returns (Kind) {
        uint256 a = aliquot(n);
        if (a == n) return Kind.Perfect;
        return a > n ? Kind.Abundant : Kind.Deficient;
    }
}
