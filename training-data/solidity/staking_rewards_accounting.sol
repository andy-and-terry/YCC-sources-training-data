// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Staking {
    uint256 public totalStaked;
    uint256 public rewardPerTokenStored;
    uint256 public lastUpdate;
    uint256 public rewardRate = 1e15;
    mapping(address => uint256) public staked;
    mapping(address => uint256) public paidPerToken;
    mapping(address => uint256) public earned;

    modifier update(address a) {
        rewardPerTokenStored = rewardPerToken();
        lastUpdate = block.timestamp;
        earned[a] = pending(a);
        paidPerToken[a] = rewardPerTokenStored;
        _;
    }

    function rewardPerToken() public view returns (uint256) {
        if (totalStaked == 0) return rewardPerTokenStored;
        return rewardPerTokenStored + ((block.timestamp - lastUpdate) * rewardRate * 1e18) / totalStaked;
    }

    function pending(address a) public view returns (uint256) {
        return earned[a] + (staked[a] * (rewardPerToken() - paidPerToken[a])) / 1e18;
    }

    function stake(uint256 amt) external update(msg.sender) { staked[msg.sender] += amt; totalStaked += amt; }
    function unstake(uint256 amt) external update(msg.sender) { staked[msg.sender] -= amt; totalStaked -= amt; }
    function claim() external update(msg.sender) returns (uint256 r) { r = earned[msg.sender]; earned[msg.sender] = 0; }
}
