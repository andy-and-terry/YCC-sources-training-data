// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ForwardEthWithCallDemo {
    error TransferFailed(address to, uint256 amount);

    function forward(address payable to) external payable {
        (bool ok, ) = to.call{value: msg.value}("");
        if (!ok) revert TransferFailed(to, msg.value);
    }

    function forwardWithGas(address payable to, uint256 gasLimit) external payable {
        (bool ok, ) = to.call{value: msg.value, gas: gasLimit}("");
        if (!ok) revert TransferFailed(to, msg.value);
    }
}
