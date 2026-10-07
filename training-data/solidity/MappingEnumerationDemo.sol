// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Mappings cannot be iterated, so keep a parallel key array.
contract MappingEnumerationDemo {
    mapping(string => uint256) private scores;
    string[] private names;

    function setScore(string calldata name, uint256 score) external {
        if (!_exists(name)) {
            names.push(name);
        }
        scores[name] = score;
    }

    function _exists(string memory name) private view returns (bool) {
        for (uint256 i = 0; i < names.length; i++) {
            if (keccak256(bytes(names[i])) == keccak256(bytes(name))) return true;
        }
        return false;
    }

    function total() external view returns (uint256 sum) {
        for (uint256 i = 0; i < names.length; i++) {
            sum += scores[names[i]];
        }
    }

    function count() external view returns (uint256) {
        return names.length;
    }

    function nameAt(uint256 i) external view returns (string memory) {
        return names[i];
    }
}
