// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WithdrawalQueueDemo {
    struct Request {
        address user;
        uint256 amount;
    }

    Request[] private queue;
    uint256 public head;
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function requestWithdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "insufficient");
        balances[msg.sender] -= amount;
        queue.push(Request(msg.sender, amount));
    }

    function pending() external view returns (uint256) {
        return queue.length - head;
    }

    // FIFO processing of up to `max` requests
    function process(uint256 max) external {
        uint256 end = head + max;
        if (end > queue.length) end = queue.length;
        while (head < end) {
            Request memory r = queue[head];
            delete queue[head];
            head++;
            (bool ok, ) = r.user.call{value: r.amount}("");
            require(ok, "transfer failed");
        }
    }
}
