// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Emirps {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    function reverseDigits(uint256 n) public pure returns (uint256 r) {
        while (n > 0) {
            r = r * 10 + n % 10;
            n /= 10;
        }
    }

    // first(10) => [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
    function first(uint256 count) external pure returns (uint256[] memory out) {
        out = new uint256[](count);
        uint256 found = 0;
        for (uint256 n = 2; found < count; n++) {
            uint256 r = reverseDigits(n);
            if (r != n && isPrime(n) && isPrime(r)) out[found++] = n;
        }
    }
}
