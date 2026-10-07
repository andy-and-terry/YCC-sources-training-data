// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal fixed-price NFT marketplace: an owner lists a token from an
// external ERC-721 collection, and any buyer can purchase it for the
// listed price, which is forwarded straight to the seller.
interface IERC721Min {
    function ownerOf(uint256 tokenId) external view returns (address);
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract NFTMarketplaceDemo {
    struct Listing {
        address seller;
        uint256 price;
    }

    IERC721Min public immutable nft;
    mapping(uint256 => Listing) public listings;

    event Listed(uint256 indexed tokenId, address indexed seller, uint256 price);
    event Sold(uint256 indexed tokenId, address indexed buyer, uint256 price);
    event ListingCanceled(uint256 indexed tokenId);

    constructor(address _nft) {
        nft = IERC721Min(_nft);
    }

    function list(uint256 tokenId, uint256 price) external {
        require(nft.ownerOf(tokenId) == msg.sender, "not token owner");
        require(price > 0, "price must be positive");
        listings[tokenId] = Listing({ seller: msg.sender, price: price });
        emit Listed(tokenId, msg.sender, price);
    }

    function cancelListing(uint256 tokenId) external {
        require(listings[tokenId].seller == msg.sender, "not seller");
        delete listings[tokenId];
        emit ListingCanceled(tokenId);
    }

    function buy(uint256 tokenId) external payable {
        Listing memory listing = listings[tokenId];
        require(listing.seller != address(0), "not listed");
        require(msg.value == listing.price, "incorrect price");

        delete listings[tokenId];
        nft.transferFrom(listing.seller, msg.sender, tokenId);
        emit Sold(tokenId, msg.sender, listing.price);

        (bool success, ) = listing.seller.call{ value: msg.value }("");
        require(success, "payment to seller failed");
    }
}
