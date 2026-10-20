// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error Insufficient(uint available, uint needed);

contract Vault {
    uint public bal = 10;
    function take(uint n) external {
        if (n > bal) revert Insufficient(bal, n);
        bal -= n;
    }
}
