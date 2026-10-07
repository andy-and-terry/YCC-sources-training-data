// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Referral bonus tracking: a buyer registers a referrer once, and
// each purchase credits a percentage of the payment to that referrer
// as a pending balance the referrer can withdraw later.
contract ReferralRewardsDemo {
    uint256 public constant REFERRAL_BPS = 500; // 5% in basis points

    mapping(address => address) public referrerOf;
    mapping(address => uint256) public pendingRewards;

    event ReferrerSet(address indexed user, address indexed referrer);
    event Purchased(address indexed buyer, uint256 amount, address indexed referrer, uint256 reward);
    event RewardWithdrawn(address indexed referrer, uint256 amount);

    function setReferrer(address referrer) external {
        require(referrerOf[msg.sender] == address(0), "referrer already set");
        require(referrer != msg.sender, "cannot refer yourself");
        referrerOf[msg.sender] = referrer;
        emit ReferrerSet(msg.sender, referrer);
    }

    function purchase() external payable {
        require(msg.value > 0, "nothing paid");

        address referrer = referrerOf[msg.sender];
        uint256 reward = 0;
        if (referrer != address(0)) {
            reward = (msg.value * REFERRAL_BPS) / 10000;
            pendingRewards[referrer] += reward;
        }

        emit Purchased(msg.sender, msg.value, referrer, reward);
    }

    function withdrawReward() external {
        uint256 amount = pendingRewards[msg.sender];
        require(amount > 0, "nothing to withdraw");

        pendingRewards[msg.sender] = 0;
        emit RewardWithdrawn(msg.sender, amount);

        (bool success, ) = msg.sender.call{ value: amount }("");
        require(success, "withdrawal failed");
    }
}
