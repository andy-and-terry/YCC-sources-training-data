// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AllowlistDemo {
    address public admin;
    mapping(address => bool) public allowed;
    uint256 public allowedCount;

    event Allowed(address indexed account);
    event Removed(address indexed account);

    modifier onlyAdmin() {
        require(msg.sender == admin, "not admin");
        _;
    }

    modifier onlyAllowed() {
        require(allowed[msg.sender], "not allowed");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function add(address account) external onlyAdmin {
        require(!allowed[account], "already allowed");
        allowed[account] = true;
        allowedCount++;
        emit Allowed(account);
    }

    function remove(address account) external onlyAdmin {
        require(allowed[account], "not on list");
        allowed[account] = false;
        allowedCount--;
        emit Removed(account);
    }

    function members_only() external view onlyAllowed returns (string memory) {
        return "welcome";
    }
}
