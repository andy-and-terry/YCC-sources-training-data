// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal NFT with EIP-2981 style royalty reporting: marketplaces call
// royaltyInfo() to learn who should be paid and how much on a sale.
contract ERC2981RoyaltyDemo {
    string public name = "RoyaltyNFT";
    string public symbol = "RNFT";
    uint256 public constant FEE_DENOMINATOR = 10000;

    mapping(uint256 => address) public ownerOf;
    address public royaltyReceiver;
    uint256 public royaltyFeeBps; // basis points, e.g. 500 = 5%

    constructor(address _royaltyReceiver, uint256 _royaltyFeeBps) {
        require(_royaltyFeeBps <= FEE_DENOMINATOR, "fee too high");
        royaltyReceiver = _royaltyReceiver;
        royaltyFeeBps = _royaltyFeeBps;
    }

    function mint(address to, uint256 tokenId) external {
        require(ownerOf[tokenId] == address(0), "already minted");
        ownerOf[tokenId] = to;
    }

    function transferFrom(address from, address to, uint256 tokenId) external {
        require(ownerOf[tokenId] == from, "not owner");
        ownerOf[tokenId] = to;
    }

    function royaltyInfo(uint256, uint256 salePrice) external view returns (address receiver, uint256 royaltyAmount) {
        receiver = royaltyReceiver;
        royaltyAmount = (salePrice * royaltyFeeBps) / FEE_DENOMINATOR;
    }
}
