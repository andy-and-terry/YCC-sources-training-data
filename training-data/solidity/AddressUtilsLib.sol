// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Small address helpers: distinguishing contracts from externally
// owned accounts, and sending ether in a way that surfaces failures
// instead of silently swallowing them.
library AddressUtilsLib {
    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "insufficient balance");
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "unable to send value");
    }
}

contract AddressUtilsDemo {
    using AddressUtilsLib for address;
    using AddressUtilsLib for address payable;

    function checkIsContract(address account) external view returns (bool) {
        return account.isContract();
    }

    function pay(address payable recipient) external payable {
        recipient.sendValue(msg.value);
    }

    receive() external payable {}
}
