// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EnumerableRolesBitmaskDemo {
    uint8 public constant ROLE_MINTER = 1 << 0;
    uint8 public constant ROLE_BURNER = 1 << 1;
    uint8 public constant ROLE_PAUSER = 1 << 2;

    mapping(address => uint8) public roles;
    address public admin;

    constructor() {
        admin = msg.sender;
        roles[msg.sender] = ROLE_MINTER | ROLE_BURNER | ROLE_PAUSER;
    }

    function grant(address who, uint8 role) external {
        require(msg.sender == admin, "not admin");
        roles[who] |= role;
    }

    function revoke(address who, uint8 role) external {
        require(msg.sender == admin, "not admin");
        roles[who] &= ~role;
    }

    function has(address who, uint8 role) public view returns (bool) {
        return roles[who] & role == role;
    }
}
