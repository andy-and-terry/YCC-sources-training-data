// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WhitelistGatedActionDemo {
    address public admin;
    mapping(address => bool) public allowed;
    uint256 public allowedCount;
    mapping(address => uint256) public actions;

    event Whitelisted(address indexed account, bool status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "not admin");
        _;
    }

    modifier onlyAllowed() {
        require(allowed[msg.sender], "not whitelisted");
        _;
    }

    constructor() {
        admin = msg.sender;
        _set(msg.sender, true);
    }

    function setAllowed(address account, bool status) external onlyAdmin {
        _set(account, status);
    }

    function setMany(address[] calldata accounts, bool status) external onlyAdmin {
        for (uint256 i = 0; i < accounts.length; i++) {
            _set(accounts[i], status);
        }
    }

    function act() external onlyAllowed {
        actions[msg.sender] += 1;
    }

    function _set(address account, bool status) internal {
        if (allowed[account] != status) {
            allowed[account] = status;
            if (status) allowedCount += 1;
            else allowedCount -= 1;
        }
        emit Whitelisted(account, status);
    }
}
