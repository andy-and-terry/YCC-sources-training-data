// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSplitterDemo {
    address[] public payees;
    uint256[] public shares;
    uint256 public totalShares;
    mapping(address => uint256) public released;
    uint256 public totalReleased;

    constructor(address[] memory _payees, uint256[] memory _shares) {
        require(_payees.length == _shares.length, "length mismatch");
        require(_payees.length > 0, "no payees");

        for (uint256 i = 0; i < _payees.length; i++) {
            require(_shares[i] > 0, "share must be positive");
            payees.push(_payees[i]);
            shares.push(_shares[i]);
            totalShares += _shares[i];
        }
    }

    receive() external payable {}

    function shareOf(address account) public view returns (uint256) {
        for (uint256 i = 0; i < payees.length; i++) {
            if (payees[i] == account) return shares[i];
        }
        return 0;
    }

    function releasable(address account) public view returns (uint256) {
        uint256 totalReceived = address(this).balance + totalReleased;
        uint256 entitled = (totalReceived * shareOf(account)) / totalShares;
        return entitled - released[account];
    }

    function release(address payable account) external {
        uint256 payment = releasable(account);
        require(payment > 0, "nothing to release");

        released[account] += payment;
        totalReleased += payment;
        account.transfer(payment);
    }
}
