// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice Withdrawal (pull-payment) pattern: instead of pushing funds to
/// recipients directly, credit them and let each recipient withdraw their
/// own balance, avoiding failed-transfer griefing and reentrancy on payout.
contract PullPaymentEscrow {
    mapping(address => uint256) public payments;
    address public payer;

    event PaymentDeposited(address indexed payee, uint256 amount);
    event PaymentWithdrawn(address indexed payee, uint256 amount);

    constructor() {
        payer = msg.sender;
    }

    function depositFor(address payee) external payable {
        require(msg.sender == payer, "only payer");
        require(msg.value > 0, "zero deposit");
        payments[payee] += msg.value;
        emit PaymentDeposited(payee, msg.value);
    }

    function withdrawPayments() external {
        uint256 amount = payments[msg.sender];
        require(amount > 0, "no payments due");

        payments[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "withdrawal failed");

        emit PaymentWithdrawn(msg.sender, amount);
    }
}
