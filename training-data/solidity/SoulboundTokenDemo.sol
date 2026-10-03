// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A soulbound (non-transferable) token: once minted to an address it
// can never be moved, matching badges/credentials use cases.
contract SoulboundTokenDemo {
    string public name = "SoulboundBadge";
    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;
    uint256 public nextTokenId;

    event Minted(address indexed to, uint256 indexed tokenId);
    event Revoked(address indexed from, uint256 indexed tokenId);

    error AlreadyBound(uint256 tokenId);
    error NotOwner();
    error TransfersDisabled();

    function mint(address to) external returns (uint256 tokenId) {
        tokenId = nextTokenId++;
        ownerOf[tokenId] = to;
        balanceOf[to] += 1;
        emit Minted(to, tokenId);
    }

    function revoke(uint256 tokenId) external {
        address owner = ownerOf[tokenId];
        if (owner != msg.sender) revert NotOwner();
        delete ownerOf[tokenId];
        balanceOf[owner] -= 1;
        emit Revoked(owner, tokenId);
    }

    // Transfers are intentionally impossible: the token is bound to
    // the soul (address) it was minted to.
    function transferFrom(address, address, uint256) external pure {
        revert TransfersDisabled();
    }
}
