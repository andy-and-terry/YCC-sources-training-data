// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// NFT minting gated by a Merkle-tree allowlist: only addresses whose
// leaf is proven to be part of the committed root may mint, and each
// address can only mint once. Distinct from a token airdrop claim --
// here the proof unlocks an action (mint) rather than a fixed payout.
contract AllowlistMerkleMintDemo {
    bytes32 public immutable merkleRoot;
    mapping(address => bool) public hasMinted;
    mapping(uint256 => address) public ownerOf;
    uint256 public nextTokenId;

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    function mint(bytes32[] calldata proof) external returns (uint256 tokenId) {
        require(!hasMinted[msg.sender], "already minted");
        require(_verify(proof, keccak256(abi.encodePacked(msg.sender))), "not on allowlist");

        hasMinted[msg.sender] = true;
        tokenId = nextTokenId++;
        ownerOf[tokenId] = msg.sender;
    }

    function _verify(bytes32[] calldata proof, bytes32 leaf) private view returns (bool) {
        bytes32 computed = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 sibling = proof[i];
            computed = computed <= sibling
                ? keccak256(abi.encodePacked(computed, sibling))
                : keccak256(abi.encodePacked(sibling, computed));
        }
        return computed == merkleRoot;
    }
}
