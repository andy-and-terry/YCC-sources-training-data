// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Emirps below 200; expect 15.
contract Emirps {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }
    function rev(uint256 n) internal pure returns (uint256 r) {
        while (n > 0) {
            r = r * 10 + n % 10;
            n /= 10;
        }
    }

    function count() external pure returns (uint256 c) {
        for (uint256 n = 2; n < 200; n++) {
            uint256 r = rev(n);
            if (r != n && isPrime(n) && isPrime(r)) c++;
        }
    }
}
