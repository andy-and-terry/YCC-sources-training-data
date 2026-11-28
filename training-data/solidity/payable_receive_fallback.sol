// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Wallet {
    event Received(address from, uint256 amount);
    receive() external payable { emit Received(msg.sender, msg.value); }
    fallback() external payable {}
    function balance() external view returns (uint256) { return address(this).balance; }
}
