// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Logic {
    uint256 public value;
    address public sender;

    function setValue(uint256 v) external {
        value = v;
        sender = msg.sender;
    }
}

contract DelegateCallDemo {
    // Storage layout must match Logic for delegatecall to write correctly
    uint256 public value;
    address public sender;
    address public immutable logic;

    constructor(address _logic) {
        logic = _logic;
    }

    function setViaDelegate(uint256 v) external {
        (bool ok, ) = logic.delegatecall(abi.encodeWithSelector(Logic.setValue.selector, v));
        require(ok, "delegatecall failed");
    }
}
