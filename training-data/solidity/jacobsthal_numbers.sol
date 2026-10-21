// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
contract Jacobsthal {
    event Term(uint256 indexed n, uint256 value);

    // Returns the first 15 terms.
    function firstTerms() public pure returns (uint256[15] memory out) {
        out[1] = 1;
        for (uint256 i = 2; i < 15; i++) {
            out[i] = out[i - 1] + 2 * out[i - 2];
        }
    }

    // Emits each term as an event so the "output" is visible in the logs.
    function printTerms() external {
        uint256[15] memory t = firstTerms();
        for (uint256 i = 0; i < 15; i++) {
            emit Term(i, t[i]);
        }
    }
}
