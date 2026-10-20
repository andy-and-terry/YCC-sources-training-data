// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract YulDemo {
    function add(uint256 a, uint256 b) external pure returns (uint256 r) {
        assembly { r := add(a, b) }
    }

    function isContract(address a) external view returns (bool c) {
        uint256 size;
        assembly { size := extcodesize(a) }
        c = size > 0;
    }

    function readSlot(uint256 slot) external view returns (bytes32 v) {
        assembly { v := sload(slot) }
    }

    function max(uint256 a, uint256 b) external pure returns (uint256 r) {
        assembly { switch gt(a, b) case 1 { r := a } default { r := b } }
    }

    function sumTo(uint256 n) external pure returns (uint256 s) {
        assembly { for { let i := 1 } iszero(gt(i, n)) { i := add(i, 1) } { s := add(s, i) } }
    }

    function keccakPair(bytes32 a, bytes32 b) external pure returns (bytes32 h) {
        assembly { mstore(0x00, a) mstore(0x20, b) h := keccak256(0x00, 0x40) }
    }
}
