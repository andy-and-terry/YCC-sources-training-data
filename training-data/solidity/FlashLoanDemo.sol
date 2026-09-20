// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFlashLoanReceiver {
    function onFlashLoan(uint256 amount, uint256 fee) external;
}

contract FlashLoanDemo {
    mapping(address => uint256) public balances;
    uint256 public constant FEE_BPS = 9;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function totalLiquidity() public view returns (uint256) {
        return address(this).balance;
    }

    function flashLoan(uint256 amount) external {
        uint256 balanceBefore = address(this).balance;
        require(amount <= balanceBefore, "insufficient liquidity");

        uint256 fee = (amount * FEE_BPS) / 10000;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "loan transfer failed");

        IFlashLoanReceiver(msg.sender).onFlashLoan(amount, fee);

        require(address(this).balance >= balanceBefore + fee, "loan not repaid with fee");
    }
}
