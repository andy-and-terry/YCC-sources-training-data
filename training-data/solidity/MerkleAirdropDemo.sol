// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MerkleAirdropDemo {
    bytes32 public merkleRoot;
    mapping(address => bool) public claimed;

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    function claim(uint256 amount, bytes32[] calldata proof) external {
        require(!claimed[msg.sender], "already claimed");

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
            } else {
                computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
            }
        }
        require(computedHash == merkleRoot, "invalid proof");

        claimed[msg.sender] = true;
        payable(msg.sender).transfer(amount);
    }

    receive() external payable {}
}
