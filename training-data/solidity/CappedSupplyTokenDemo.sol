// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error CapExceeded(uint256 cap, uint256 attemptedSupply);

// ERC20-style token with a hard-coded maximum supply: minting past
// the cap always reverts, so total supply can never exceed it.
contract CappedSupplyTokenDemo {
    string public name = "CappedToken";
    string public symbol = "CAP";
    uint256 public immutable maxSupply;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 amount);

    constructor(uint256 _maxSupply) {
        owner = msg.sender;
        maxSupply = _maxSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        uint256 newSupply = totalSupply + amount;
        if (newSupply > maxSupply) {
            revert CapExceeded(maxSupply, newSupply);
        }
        totalSupply = newSupply;
        balanceOf[to] += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(balanceOf[msg.sender] >= value, "insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
