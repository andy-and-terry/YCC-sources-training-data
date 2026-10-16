// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerOverflowCheckedDemo {
    function checkedAdd(uint8 a, uint8 b) external pure returns (uint8) {
        return a + b; // reverts with Panic(0x11) on overflow
    }

    function wrappingAdd(uint8 a, uint8 b) external pure returns (uint8) {
        unchecked {
            return a + b;
        }
    }

    function tryAdd(uint256 a, uint256 b) external pure returns (bool ok, uint256 sum) {
        unchecked {
            sum = a + b;
            ok = sum >= a;
        }
    }
}
