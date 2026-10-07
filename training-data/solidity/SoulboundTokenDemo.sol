// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SoulboundTokenDemo {
    string public name = "Soulbound";
    address public immutable issuer;
    uint256 public nextId;
    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;

    event Minted(address indexed to, uint256 indexed id);
    error Soulbound();
    error NotIssuer();

    constructor() {
        issuer = msg.sender;
    }

    function mint(address to) external returns (uint256 id) {
        if (msg.sender != issuer) revert NotIssuer();
        id = nextId++;
        ownerOf[id] = to;
        balanceOf[to]++;
        emit Minted(to, id);
    }

    function transferFrom(address, address, uint256) external pure {
        revert Soulbound();
    }
}
