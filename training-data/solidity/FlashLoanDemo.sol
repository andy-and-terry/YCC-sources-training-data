// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Callback interface a flash-loan borrower must implement.
interface IFlashLoanReceiver {
    function onFlashLoan(uint256 amount, uint256 fee) external;
}

// Minimal ETH flash loan pool: lends its balance for the duration of a
// single transaction and requires it back plus a fee before the call
// that granted the loan returns.
contract FlashLoanDemo {
    uint256 public feeBps = 9; // 0.09%, in basis points
    uint256 public constant FEE_DENOMINATOR = 10000;

    function deposit() external payable {}

    function flashLoan(uint256 amount, address borrower) external {
        uint256 balanceBefore = address(this).balance;
        require(amount <= balanceBefore, "insufficient liquidity");

        uint256 fee = (amount * feeBps) / FEE_DENOMINATOR;

        payable(borrower).transfer(amount);
        IFlashLoanReceiver(borrower).onFlashLoan(amount, fee);

        require(address(this).balance >= balanceBefore + fee, "loan not repaid");
    }

    receive() external payable {}
}
