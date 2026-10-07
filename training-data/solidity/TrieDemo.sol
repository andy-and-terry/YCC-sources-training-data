// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A minimal lowercase-letter trie over on-chain storage, demonstrating
// insert/contains without any off-chain-computed data structure.
contract TrieDemo {
    struct Node {
        mapping(uint8 => uint256) children; // 0 means "no child"
        bool isWord;
    }

    Node[] private nodes;

    constructor() {
        nodes.push(); // node 0 is the root
    }

    function _charIndex(bytes1 c) private pure returns (uint8) {
        return uint8(c) - uint8(bytes1("a"));
    }

    function insert(string calldata word) external {
        uint256 current = 0;
        bytes memory w = bytes(word);
        for (uint256 i = 0; i < w.length; i++) {
            uint8 idx = _charIndex(w[i]);
            uint256 next = nodes[current].children[idx];
            if (next == 0) {
                nodes.push();
                next = nodes.length - 1;
                nodes[current].children[idx] = next;
            }
            current = next;
        }
        nodes[current].isWord = true;
    }

    function contains(string calldata word) external view returns (bool) {
        uint256 current = 0;
        bytes memory w = bytes(word);
        for (uint256 i = 0; i < w.length; i++) {
            uint8 idx = _charIndex(w[i]);
            uint256 next = nodes[current].children[idx];
            if (next == 0) return false;
            current = next;
        }
        return nodes[current].isWord;
    }
}
