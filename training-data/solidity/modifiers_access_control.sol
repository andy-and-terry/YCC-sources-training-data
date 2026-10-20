// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AccessControlled {
    address public owner;
    mapping(address => bool) public admins;
    bool private locked;

    error NotOwner(address caller);
    error NotAdmin();
    error Reentrant();

    event AdminAdded(address indexed who);
    event OwnershipTransferred(address indexed from, address indexed to);

    constructor() { owner = msg.sender; admins[msg.sender] = true; }

    modifier onlyOwner() { if (msg.sender != owner) revert NotOwner(msg.sender); _; }
    modifier onlyAdmin() { if (!admins[msg.sender]) revert NotAdmin(); _; }
    modifier nonReentrant() { if (locked) revert Reentrant(); locked = true; _; locked = false; }

    function addAdmin(address a) external onlyOwner { admins[a] = true; emit AdminAdded(a); }
    function transferOwnership(address to) external onlyOwner { emit OwnershipTransferred(owner, to); owner = to; }
    function protectedAction() external onlyAdmin nonReentrant returns (string memory) { return "ok"; }
}
