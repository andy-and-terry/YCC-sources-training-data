// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MiniToken {
    string public constant name = "Mini";
    string public constant symbol = "MINI";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initial) { _mint(msg.sender, initial); }

    function transfer(address to, uint256 v) external returns (bool) { _transfer(msg.sender, to, v); return true; }

    function approve(address spender, uint256 v) external returns (bool) {
        allowance[msg.sender][spender] = v;
        emit Approval(msg.sender, spender, v);
        return true;
    }

    function transferFrom(address from, address to, uint256 v) external returns (bool) {
        uint256 a = allowance[from][msg.sender];
        require(a >= v, "allowance");
        unchecked { allowance[from][msg.sender] = a - v; }
        _transfer(from, to, v);
        return true;
    }

    function _transfer(address from, address to, uint256 v) internal {
        require(to != address(0), "zero address");
        require(balanceOf[from] >= v, "balance");
        unchecked { balanceOf[from] -= v; }
        balanceOf[to] += v;
        emit Transfer(from, to, v);
    }

    function _mint(address to, uint256 v) internal { totalSupply += v; balanceOf[to] += v; emit Transfer(address(0), to, v); }
}
