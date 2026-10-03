// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Side-by-side comparison of the checks-effects-interactions pattern:
// the vulnerable version updates state *after* the external call,
// letting a reentrant callback drain more than it deposited; the safe
// version updates state first, so a reentrant call sees a zero
// balance and has nothing left to withdraw.
contract ChecksEffectsInteractionsDemo {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // VULNERABLE: external call happens before the balance is zeroed.
    function withdrawUnsafe() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "nothing to withdraw");

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "transfer failed");

        balances[msg.sender] = 0; // too late: a reentrant call already ran
    }

    // SAFE: effects (state update) happen before the interaction (call).
    function withdrawSafe() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "nothing to withdraw");

        balances[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "transfer failed");
    }
}
