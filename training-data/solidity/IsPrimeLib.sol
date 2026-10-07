// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library IsPrimeLib {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        if (n < 4) return true;
        if (n % 2 == 0 || n % 3 == 0) return false;
        for (uint256 i = 5; i * i <= n; i += 6) {
            if (n % i == 0 || n % (i + 2) == 0) return false;
        }
        return true;
    }
}

contract IsPrimeDemo {
    function check(uint256 n) external pure returns (bool) {
        return IsPrimeLib.isPrime(n);
    }
}
