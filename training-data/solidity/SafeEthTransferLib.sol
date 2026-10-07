// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeEthTransferLib {
    error ETHTransferFailed();

    function safeSend(address payable to, uint256 amount) internal {
        (bool ok, ) = to.call{value: amount}("");
        if (!ok) revert ETHTransferFailed();
    }

    function safeSendLimitedGas(address payable to, uint256 amount, uint256 gasLimit) internal returns (bool) {
        (bool ok, ) = to.call{value: amount, gas: gasLimit}("");
        return ok;
    }
}

contract TipJar {
    using SafeEthTransferLib for address payable;

    address public owner;
    mapping(address => uint256) public tips;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        tips[msg.sender] += msg.value;
    }

    function withdraw(address payable to, uint256 amount) external {
        require(msg.sender == owner, "not owner");
        require(amount <= address(this).balance, "insufficient balance");
        to.safeSend(amount);
    }
}
