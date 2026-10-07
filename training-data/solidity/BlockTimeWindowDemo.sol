// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlockTimeWindowDemo {
    uint256 public immutable start;
    uint256 public immutable end;
    mapping(address => uint256) public deposits;

    constructor(uint256 duration) {
        start = block.timestamp;
        end = block.timestamp + duration;
    }

    modifier whileOpen() {
        require(block.timestamp >= start && block.timestamp < end, "window closed");
        _;
    }

    modifier afterClose() {
        require(block.timestamp >= end, "still open");
        _;
    }

    function deposit() external payable whileOpen {
        deposits[msg.sender] += msg.value;
    }

    function withdraw() external afterClose {
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "nothing to withdraw");
        deposits[msg.sender] = 0;
        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "transfer failed");
    }

    function timeLeft() external view returns (uint256) {
        return block.timestamp >= end ? 0 : end - block.timestamp;
    }

    function currentBlock() external view returns (uint256 number, uint256 chainId) {
        return (block.number, block.chainid);
    }
}
