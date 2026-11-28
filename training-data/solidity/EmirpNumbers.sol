// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EmirpNumbers {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }

    function reverseDigits(uint256 n) internal pure returns (uint256 r) {
        while (n > 0) {
            r = r * 10 + n % 10;
            n /= 10;
        }
    }

    function isEmirp(uint256 p) public pure returns (bool) {
        uint256 r = reverseDigits(p);
        return r != p && isPrime(p) && isPrime(r);
    }

    function check() external pure returns (bool, bool, bool) {
        return (isEmirp(13), isEmirp(11), isEmirp(14)); // (true, false, false)
    }
}
