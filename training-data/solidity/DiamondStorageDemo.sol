// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sketch of the EIP-2535 "diamond storage" pattern: state lives in a
// struct pinned to a fixed, namespaced storage slot instead of the
// contract's normal sequential layout. This lets multiple facets of a
// diamond proxy share state without colliding on storage slots.
library LibDiamondStorage {
    bytes32 private constant STORAGE_SLOT = keccak256("demo.diamond.storage.v1");

    struct DiamondStorage {
        address owner;
        uint256 counter;
        mapping(bytes4 => address) selectorToFacet;
    }

    function diamondStorage() internal pure returns (DiamondStorage storage ds) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            ds.slot := slot
        }
    }
}

contract DiamondStorageDemo {
    constructor() {
        LibDiamondStorage.diamondStorage().owner = msg.sender;
    }

    function owner() external view returns (address) {
        return LibDiamondStorage.diamondStorage().owner;
    }

    function increment() external returns (uint256) {
        LibDiamondStorage.DiamondStorage storage ds = LibDiamondStorage.diamondStorage();
        ds.counter += 1;
        return ds.counter;
    }

    function counter() external view returns (uint256) {
        return LibDiamondStorage.diamondStorage().counter;
    }

    function registerFacet(bytes4 selector, address facet) external {
        LibDiamondStorage.DiamondStorage storage ds = LibDiamondStorage.diamondStorage();
        require(msg.sender == ds.owner, "not owner");
        ds.selectorToFacet[selector] = facet;
    }

    function facetOf(bytes4 selector) external view returns (address) {
        return LibDiamondStorage.diamondStorage().selectorToFacet[selector];
    }
}
