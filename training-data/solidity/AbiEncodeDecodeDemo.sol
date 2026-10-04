// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiEncodeDecodeDemo {
    struct Order {
        address buyer;
        uint256 amount;
        string note;
    }

    function encodeOrder(Order calldata o) external pure returns (bytes memory) {
        return abi.encode(o.buyer, o.amount, o.note);
    }

    function decodeOrder(bytes calldata data) external pure returns (Order memory o) {
        (o.buyer, o.amount, o.note) = abi.decode(data, (address, uint256, string));
    }

    // encodePacked drops padding: ("a", "bc") and ("ab", "c") collide.
    function packedHash(string calldata a, string calldata b) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }

    function safeHash(string calldata a, string calldata b) external pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }

    function selectorOf() external pure returns (bytes4) {
        return bytes4(keccak256("transfer(address,uint256)"));
    }

    function encodeCall(address to, uint256 amount) external pure returns (bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }
}
