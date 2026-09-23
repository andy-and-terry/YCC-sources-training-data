// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Unlike a plain linear vesting schedule, nothing at all is releasable
// until the cliff has passed -- then the whole cliff period's worth of
// tokens unlocks at once, and linear vesting continues from there.
contract VestingWithCliffDemo {
    address public beneficiary;
    uint256 public totalAmount;
    uint256 public startTime;
    uint256 public cliffDuration;
    uint256 public vestingDuration;
    uint256 public released;

    constructor(
        address _beneficiary,
        uint256 _totalAmount,
        uint256 _cliffDuration,
        uint256 _vestingDuration
    ) {
        require(_vestingDuration >= _cliffDuration, "cliff exceeds duration");
        beneficiary = _beneficiary;
        totalAmount = _totalAmount;
        startTime = block.timestamp;
        cliffDuration = _cliffDuration;
        vestingDuration = _vestingDuration;
    }

    function vestedAmount() public view returns (uint256) {
        if (block.timestamp < startTime + cliffDuration) {
            return 0;
        }
        if (block.timestamp >= startTime + vestingDuration) {
            return totalAmount;
        }
        return (totalAmount * (block.timestamp - startTime)) / vestingDuration;
    }

    function release() external returns (uint256) {
        require(msg.sender == beneficiary, "not beneficiary");
        uint256 unreleased = vestedAmount() - released;
        require(unreleased > 0, "nothing to release");
        released += unreleased;
        return unreleased;
    }
}
