// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakingRewardsDemo {
    mapping(address => uint256) public stakedAmount;
    mapping(address => uint256) public stakedAt;
    uint256 public rewardRatePerSecond = 1;

    function stake() external payable {
        require(msg.value > 0, "nothing to stake");
        stakedAmount[msg.sender] += msg.value;
        stakedAt[msg.sender] = block.timestamp;
    }

    function pendingReward(address account) public view returns (uint256) {
        if (stakedAmount[account] == 0) return 0;
        uint256 elapsed = block.timestamp - stakedAt[account];
        return elapsed * rewardRatePerSecond;
    }

    function unstake() external {
        uint256 amount = stakedAmount[msg.sender];
        require(amount > 0, "nothing staked");
        uint256 reward = pendingReward(msg.sender);
        stakedAmount[msg.sender] = 0;
        stakedAt[msg.sender] = 0;
        payable(msg.sender).transfer(amount + reward);
    }

    receive() external payable {}
}
