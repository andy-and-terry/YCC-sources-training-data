// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// Guard implemented with a single storage slot toggled between 1 and 2.
contract LockedWithdrawDemo {
    mapping(address => uint256) public balances;
    uint256 private _status = 1;

    error Reentrant();
    error NothingToWithdraw();

    modifier nonReentrant() {
        if (_status == 2) revert Reentrant();
        _status = 2;
        _;
        _status = 1;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external nonReentrant {
        uint256 amount = balances[msg.sender];
        if (amount == 0) revert NothingToWithdraw();
        balances[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "transfer failed");
    }
}
