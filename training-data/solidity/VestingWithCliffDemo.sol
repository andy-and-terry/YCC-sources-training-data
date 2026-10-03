// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Linear vesting with a cliff: nothing is releasable before the cliff
// elapses, after which the full cliff-period amount unlocks at once
// and the remainder vests linearly to the end of the duration. Distinct
// from TokenVestingDemo, which vests linearly from time zero with no
// cliff.
contract VestingWithCliffDemo {
    address public beneficiary;
    uint256 public totalAmount;
    uint256 public startTime;
    uint256 public cliffDuration;
    uint256 public totalDuration;
    uint256 public released;

    constructor(address _beneficiary, uint256 _totalAmount, uint256 _cliffDuration, uint256 _totalDuration) {
        require(_cliffDuration <= _totalDuration, "cliff exceeds duration");
        beneficiary = _beneficiary;
        totalAmount = _totalAmount;
        startTime = block.timestamp;
        cliffDuration = _cliffDuration;
        totalDuration = _totalDuration;
    }

    function vestedAmount() public view returns (uint256) {
        uint256 elapsed = block.timestamp - startTime;
        if (elapsed < cliffDuration) return 0;
        if (elapsed >= totalDuration) return totalAmount;
        return (totalAmount * elapsed) / totalDuration;
    }

    function release() external returns (uint256) {
        require(msg.sender == beneficiary, "not beneficiary");
        uint256 unreleased = vestedAmount() - released;
        require(unreleased > 0, "nothing vested yet");
        released += unreleased;
        return unreleased;
    }
}
