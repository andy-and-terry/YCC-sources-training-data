// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// "Pull over push": instead of sending funds out inside a state-changing
// call (which can revert the whole transaction if the recipient rejects
// the transfer, or open a reentrancy hole), credit an internal ledger
// and let each recipient withdraw for themselves.
contract PullPaymentDemo {
    mapping(address => uint256) private payments;

    event PaymentCredited(address indexed payee, uint256 amount);
    event Withdrawn(address indexed payee, uint256 amount);

    function creditPayment(address payee) external payable {
        require(msg.value > 0, "nothing to credit");
        payments[payee] += msg.value;
        emit PaymentCredited(payee, msg.value);
    }

    function paymentsOwed(address payee) external view returns (uint256) {
        return payments[payee];
    }

    function withdrawPayments() external {
        uint256 amount = payments[msg.sender];
        require(amount > 0, "no payments due");

        payments[msg.sender] = 0; // effects before interaction
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "withdrawal failed");

        emit Withdrawn(msg.sender, amount);
    }
}
