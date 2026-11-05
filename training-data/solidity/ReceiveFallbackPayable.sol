// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Wallet {
    event Received(address from, uint256 amt);
    event FallbackCalled(bytes data);

    receive() external payable { emit Received(msg.sender, msg.value); }
    fallback() external payable { emit FallbackCalled(msg.data); }

    function balance() external view returns (uint256) { return address(this).balance; }
}
