// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Reentrancy lock stored in transient storage (EIP-1153): the slot is
// cleared automatically at the end of every transaction, so no refund
// logic or storage reset is needed.
contract TransientReentrancyLockDemo {
    // Arbitrary unique slot derived from a label
    bytes32 private constant LOCK_SLOT = keccak256("transient.reentrancy.lock");

    mapping(address => uint256) public balances;

    error Reentrant();
    error NothingToWithdraw();
    error TransferFailed();

    modifier nonReentrant() {
        bytes32 slot = LOCK_SLOT;
        uint256 locked;
        assembly {
            locked := tload(slot)
        }
        if (locked != 0) revert Reentrant();
        assembly {
            tstore(slot, 1)
        }
        _;
        assembly {
            tstore(slot, 0)
        }
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external nonReentrant {
        uint256 amount = balances[msg.sender];
        if (amount == 0) revert NothingToWithdraw();
        balances[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: amount}("");
        if (!ok) revert TransferFailed();
    }
}
