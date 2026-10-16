// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ShadowedStateVariableDemo {
    uint256 public value = 10;

    function localShadow() external view returns (uint256) {
        uint256 v = value;
        {
            uint256 inner = v * 2;
            v = inner + 1;
        }
        return v;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}
