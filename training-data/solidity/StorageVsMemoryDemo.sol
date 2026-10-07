// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StorageVsMemoryDemo {
    struct Account {
        string name;
        uint256 balance;
    }

    Account[] public accounts;

    constructor() {
        accounts.push(Account("alice", 100));
        accounts.push(Account("bob", 50));
    }

    // memory copy: changes are lost
    function bumpMemory(uint256 i) external view returns (uint256) {
        Account memory acc = accounts[i];
        acc.balance += 10;
        return acc.balance;
    }

    // storage pointer: changes persist
    function bumpStorage(uint256 i) external returns (uint256) {
        Account storage acc = accounts[i];
        acc.balance += 10;
        return acc.balance;
    }

    function balanceOf(uint256 i) external view returns (uint256) {
        return accounts[i].balance;
    }

    function rename(uint256 i, string calldata newName) external {
        accounts[i].name = newName;
    }

    function totalBalance() external view returns (uint256 total) {
        Account[] memory snapshot = accounts;
        for (uint256 i = 0; i < snapshot.length; i++) {
            total += snapshot[i].balance;
        }
    }
}
