// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrimesBelowCount {
    function count(uint256 n) public pure returns (uint256 total) {
        if (n < 3) return 0;
        bool[] memory composite = new bool[](n);
        for (uint256 i = 2; i < n; i++) {
            if (composite[i]) continue;
            total++;
            for (uint256 j = i * i; j < n; j += i) composite[j] = true;
        }
    }
}
