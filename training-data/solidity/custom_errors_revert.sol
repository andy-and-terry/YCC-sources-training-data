// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error Unauthorized(address caller);

contract Guarded {
    address immutable admin;
    constructor() { admin = msg.sender; }
    function secret() external view returns (uint256) {
        if (msg.sender != admin) revert Unauthorized(msg.sender);
        return 42;
    }
}
