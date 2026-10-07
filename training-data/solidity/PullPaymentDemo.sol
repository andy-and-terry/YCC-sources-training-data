// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Pull-over-push payments: instead of sending ether directly to a
// recipient (which can fail or be reentered), a payer credits the
// recipient's balance and the recipient withdraws it themselves.
contract PullPaymentDemo {
    mapping(address => uint256) public payments;

    event PaymentCredited(address indexed from, address indexed to, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    function pay(address recipient) external payable {
        require(msg.value > 0, "nothing to pay");
        payments[recipient] += msg.value;
        emit PaymentCredited(msg.sender, recipient, msg.value);
    }

    function withdrawPayments() external {
        uint256 amount = payments[msg.sender];
        require(amount > 0, "no balance due");

        payments[msg.sender] = 0;
        emit Withdrawn(msg.sender, amount);

        (bool success, ) = msg.sender.call{ value: amount }("");
        require(success, "withdrawal failed");
    }
}
