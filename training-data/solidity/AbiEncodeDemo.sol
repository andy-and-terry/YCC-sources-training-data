// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AbiEncodeDemo {
    function encode(uint256 a, string calldata s) external pure returns (bytes memory) {
        return abi.encode(a, s);
    }

    function encodePacked(uint16 a, bytes2 b) external pure returns (bytes memory) {
        return abi.encodePacked(a, b);
    }

    function decode(bytes calldata data) external pure returns (uint256 a, string memory s) {
        (a, s) = abi.decode(data, (uint256, string));
    }

    function selector() external pure returns (bytes4) {
        return bytes4(keccak256("transfer(address,uint256)"));
    }

    function callData(address to, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }
}
