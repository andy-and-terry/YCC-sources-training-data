// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AbiEncodeDecodeDemo {
    function encode(uint256 a, string calldata s) external pure returns (bytes memory) {
        return abi.encode(a, s);
    }

    function decode(bytes calldata data) external pure returns (uint256 a, string memory s) {
        (a, s) = abi.decode(data, (uint256, string));
    }

    function packedHash(address user, uint256 nonce) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(user, nonce));
    }

    function selector() external pure returns (bytes4) {
        return bytes4(keccak256("transfer(address,uint256)"));
    }

    function callData(address to, uint256 amt) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", to, amt);
    }

    function viaSelector(address to, uint256 amt) external pure returns (bytes memory) {
        return abi.encodeWithSelector(bytes4(0xa9059cbb), to, amt);
    }
}
