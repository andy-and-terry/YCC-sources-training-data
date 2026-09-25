// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Tiny probabilistic set membership structure: three independent
// hashes of each item set bits in a 256-bit field. Membership checks
// can report false positives but never false negatives.
contract BloomFilterDemo {
    uint256 private bitField;

    function _bitPositions(bytes32 item) private pure returns (uint8 a, uint8 b, uint8 c) {
        a = uint8(uint256(keccak256(abi.encodePacked("A", item))) % 256);
        b = uint8(uint256(keccak256(abi.encodePacked("B", item))) % 256);
        c = uint8(uint256(keccak256(abi.encodePacked("C", item))) % 256);
    }

    function add(bytes32 item) external {
        (uint8 a, uint8 b, uint8 c) = _bitPositions(item);
        bitField |= (1 << a) | (1 << b) | (1 << c);
    }

    function mightContain(bytes32 item) external view returns (bool) {
        (uint8 a, uint8 b, uint8 c) = _bitPositions(item);
        uint256 mask = (1 << a) | (1 << b) | (1 << c);
        return (bitField & mask) == mask;
    }
}
