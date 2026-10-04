// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoulboundTokenDemo {
    string public name = "Soulbound Badge";
    address public issuer;
    uint256 public nextId = 1;

    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;

    event Issued(address indexed to, uint256 indexed tokenId);
    event Revoked(address indexed from, uint256 indexed tokenId);

    error NotIssuer();
    error AlreadyHolder();
    error Soulbound();

    modifier onlyIssuer() {
        if (msg.sender != issuer) revert NotIssuer();
        _;
    }

    constructor() {
        issuer = msg.sender;
    }

    function issue(address to) external onlyIssuer returns (uint256 id) {
        if (balanceOf[to] != 0) revert AlreadyHolder();
        id = nextId++;
        ownerOf[id] = to;
        balanceOf[to] = 1;
        emit Issued(to, id);
    }

    function revoke(uint256 id) external onlyIssuer {
        address holder = ownerOf[id];
        require(holder != address(0), "no such token");
        delete ownerOf[id];
        balanceOf[holder] = 0;
        emit Revoked(holder, id);
    }

    function transferFrom(address, address, uint256) external pure {
        revert Soulbound();
    }
}
