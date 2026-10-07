// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VaultSharesDemo {
    mapping(address => uint256) public sharesOf;
    uint256 public totalShares;
    uint256 public totalAssets;

    function deposit() external payable {
        uint256 shares;
        if (totalShares == 0) {
            shares = msg.value;
        } else {
            shares = (msg.value * totalShares) / totalAssets;
        }
        sharesOf[msg.sender] += shares;
        totalShares += shares;
        totalAssets += msg.value;
    }

    function withdraw(uint256 shares) external {
        require(sharesOf[msg.sender] >= shares, "insufficient shares");
        uint256 amount = (shares * totalAssets) / totalShares;

        sharesOf[msg.sender] -= shares;
        totalShares -= shares;
        totalAssets -= amount;

        payable(msg.sender).transfer(amount);
    }

    receive() external payable {
        totalAssets += msg.value;
    }
}
