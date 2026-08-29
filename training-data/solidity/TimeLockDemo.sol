// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockDemo {
    address public beneficiary;
    uint256 public unlockTime;

    constructor(address _beneficiary, uint256 _unlockTime) payable {
        beneficiary = _beneficiary;
        unlockTime = _unlockTime;
    }

    function withdraw() external {
        require(block.timestamp >= unlockTime, "Funds are locked");
        require(msg.sender == beneficiary, "Not the beneficiary");
        payable(beneficiary).transfer(address(this).balance);
    }
}
