// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AbiEncodeDecodeDemo {
    function encode(uint256 a, string calldata s, address who) external pure returns (bytes memory) {
        return abi.encode(a, s, who);
    }

    function decode(bytes calldata data) external pure returns (uint256, string memory, address) {
        return abi.decode(data, (uint256, string, address));
    }

    function encodePacked(string calldata a, string calldata b) external pure returns (bytes memory) {
        return abi.encodePacked(a, b);
    }

    function hashPair(uint256 a, uint256 b) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }

    function selectorOf() external pure returns (bytes4) {
        return bytes4(keccak256("transfer(address,uint256)"));
    }

    function encodeCall(address to, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }

    function selectorMatches() external pure returns (bool) {
        bytes memory payload = abi.encodeWithSelector(0xa9059cbb, address(0xBEEF), 1);
        return bytes4(payload) == 0xa9059cbb;
    }
}
