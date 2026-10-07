// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SignatureVerificationLib {
    function splitSignature(bytes memory sig)
        internal
        pure
        returns (bytes32 r, bytes32 s, uint8 v)
    {
        require(sig.length == 65, "invalid signature length");
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }

    function recoverSigner(bytes32 messageHash, bytes memory signature)
        internal
        pure
        returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(signature);
        return ecrecover(messageHash, v, r, s);
    }

    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

contract SignedMessageDemo {
    using SignatureVerificationLib for bytes32;

    function verify(address signer, string memory message, bytes memory signature)
        external
        pure
        returns (bool)
    {
        bytes32 messageHash = keccak256(abi.encodePacked(message));
        bytes32 ethHash = SignatureVerificationLib.toEthSignedMessageHash(messageHash);
        return SignatureVerificationLib.recoverSigner(ethHash, signature) == signer;
    }
}
