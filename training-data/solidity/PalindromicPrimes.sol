// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PalindromicPrimes {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }

    function isPalindrome(uint256 n) internal pure returns (bool) {
        uint256 r;
        for (uint256 m = n; m > 0; m /= 10) r = r * 10 + m % 10;
        return r == n;
    }

    function isPalindromicPrime(uint256 n) public pure returns (bool) {
        return isPalindrome(n) && isPrime(n);
    }

    function check() external pure returns (bool, bool) {
        return (isPalindromicPrime(131), isPalindromicPrime(121)); // (true, false)
    }
}
