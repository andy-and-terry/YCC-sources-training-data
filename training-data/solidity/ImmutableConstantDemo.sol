// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ImmutableConstantDemo {
    uint256 public constant MAX_SUPPLY = 1_000_000;
    string public constant NAME = "Demo";
    address public immutable deployer;
    uint256 public immutable deployedAt;
    uint256 public immutable cap;

    constructor(uint256 _cap) {
        require(_cap <= MAX_SUPPLY, "cap too high");
        deployer = msg.sender;
        deployedAt = block.timestamp;
        cap = _cap;
    }

    function remaining(uint256 minted) external view returns (uint256) {
        return cap - minted;
    }
}
