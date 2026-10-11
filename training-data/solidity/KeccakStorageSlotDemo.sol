// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract KeccakStorageSlotDemo {
    bytes32 private constant SLOT = keccak256("demo.storage.counter");

    function increment() external {
        bytes32 slot = SLOT;
        uint256 v;
        assembly {
            v := sload(slot)
            v := add(v, 1)
            sstore(slot, v)
        }
    }

    function current() external view returns (uint256 v) {
        bytes32 slot = SLOT;
        assembly {
            v := sload(slot)
        }
    }
}
