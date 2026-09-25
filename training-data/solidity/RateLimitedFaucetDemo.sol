// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Faucet that pays out a fixed drip and enforces a per-address
// cooldown so the same account cannot drain it repeatedly.
contract RateLimitedFaucetDemo {
    uint256 public constant DRIP_AMOUNT = 0.01 ether;
    uint256 public constant COOLDOWN = 1 days;

    mapping(address => uint256) public lastClaimedAt;

    event Dripped(address indexed to, uint256 amount);

    receive() external payable {}

    modifier respectsCooldown() {
        require(block.timestamp >= lastClaimedAt[msg.sender] + COOLDOWN, "cooldown active");
        _;
    }

    function claim() external respectsCooldown {
        require(address(this).balance >= DRIP_AMOUNT, "faucet is empty");

        lastClaimedAt[msg.sender] = block.timestamp;
        emit Dripped(msg.sender, DRIP_AMOUNT);

        (bool success, ) = msg.sender.call{ value: DRIP_AMOUNT }("");
        require(success, "transfer failed");
    }

    function timeUntilNextClaim(address account) external view returns (uint256) {
        uint256 nextClaim = lastClaimedAt[account] + COOLDOWN;
        if (block.timestamp >= nextClaim) return 0;
        return nextClaim - block.timestamp;
    }
}
