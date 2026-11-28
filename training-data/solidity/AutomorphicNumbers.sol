// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract AutomorphicNumbers {
    function isAutomorphic(uint256 n) public pure returns (bool) {
        uint256 modulus = 10;
        for (uint256 m = n; m >= 10; m /= 10) {
            modulus *= 10;
        }
        return (n * n) % modulus == n;
    }

    function check() external pure returns (bool, bool) {
        return (isAutomorphic(76), isAutomorphic(77)); // (true, false)
    }
}
