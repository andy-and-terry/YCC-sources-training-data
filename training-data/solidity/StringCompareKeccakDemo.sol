// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Strings cannot be compared with ==; compare their keccak256 hashes.
contract StringCompareKeccakDemo {
    string public stored = "hello";

    function equals(string memory a, string memory b) public pure returns (bool) {
        // length check first is a cheap short circuit
        if (bytes(a).length != bytes(b).length) return false;
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function matchesStored(string calldata s) external view returns (bool) {
        return equals(stored, s);
    }

    function startsWith(string memory s, string memory prefix) public pure returns (bool) {
        bytes memory a = bytes(s);
        bytes memory p = bytes(prefix);
        if (p.length > a.length) return false;
        for (uint256 i = 0; i < p.length; i++) {
            if (a[i] != p[i]) return false;
        }
        return true;
    }

    function byteLength(string memory s) public pure returns (uint256) {
        return bytes(s).length; // bytes, not characters
    }
}
