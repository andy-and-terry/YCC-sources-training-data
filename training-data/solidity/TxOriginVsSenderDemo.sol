// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// tx.origin is the externally owned account that started the transaction;
// msg.sender is the immediate caller. Authorizing with tx.origin is unsafe
// because a malicious intermediate contract can relay a call from the owner.
contract Wallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function isOwnerSender() external view returns (bool) {
        return msg.sender == owner;
    }

    function isOwnerOrigin() external view returns (bool) {
        return tx.origin == owner;
    }

    function callers() external view returns (address sender, address origin) {
        return (msg.sender, tx.origin);
    }
}

contract Relay {
    Wallet public wallet;

    constructor(Wallet w) {
        wallet = w;
    }

    // When the owner calls this, wallet sees sender == Relay but origin == owner.
    function probe() external view returns (bool bySender, bool byOrigin) {
        return (wallet.isOwnerSender(), wallet.isOwnerOrigin());
    }
}
