// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AddressBalanceCodeSizeDemo {
    function isContract(address a) public view returns (bool) {
        return a.code.length > 0;
    }

    function balanceOf(address a) external view returns (uint256) {
        return a.balance;
    }

    function selfInfo() external view returns (address self, bool contractFlag, bytes32 codeHash) {
        self = address(this);
        contractFlag = isContract(self);
        codeHash = self.codehash;
    }
}
