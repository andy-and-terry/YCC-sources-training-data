// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ECRecoverPrefixedHashDemo {
    function ethSignedHash(bytes32 h) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", h));
    }

    function recover(bytes32 h, uint8 v, bytes32 r, bytes32 s) external pure returns (address) {
        address signer = ecrecover(ethSignedHash(h), v, r, s);
        require(signer != address(0), "invalid signature");
        return signer;
    }
}
