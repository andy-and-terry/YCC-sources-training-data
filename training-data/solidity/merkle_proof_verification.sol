// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MerkleAirdrop {
    bytes32 public immutable root;
    mapping(uint256 => bool) public claimed;
    event Claimed(uint256 indexed index, address indexed account, uint256 amount);

    constructor(bytes32 _root) { root = _root; }

    function verify(bytes32[] calldata proof, bytes32 leaf) public view returns (bool) {
        bytes32 h = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 p = proof[i];
            h = h <= p ? keccak256(abi.encodePacked(h, p)) : keccak256(abi.encodePacked(p, h));
        }
        return h == root;
    }

    function claim(uint256 index, address account, uint256 amount, bytes32[] calldata proof) external {
        require(!claimed[index], "already claimed");
        bytes32 leaf = keccak256(bytes.concat(keccak256(abi.encode(index, account, amount))));
        require(verify(proof, leaf), "bad proof");
        claimed[index] = true;
        emit Claimed(index, account, amount);
    }
}
