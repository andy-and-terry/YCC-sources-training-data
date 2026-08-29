// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RolesAccessControlDemo {
    mapping(bytes32 => mapping(address => bool)) private roles;
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor() {
        roles[ADMIN_ROLE][msg.sender] = true;
    }

    modifier onlyRole(bytes32 role) {
        require(roles[role][msg.sender], "Missing role");
        _;
    }

    function grantRole(bytes32 role, address account) external onlyRole(ADMIN_ROLE) {
        roles[role][account] = true;
    }
}
