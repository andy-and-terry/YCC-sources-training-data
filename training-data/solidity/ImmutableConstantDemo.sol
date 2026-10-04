// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ImmutableConstantDemo {
    uint256 public constant MAX_SUPPLY = 10_000;
    string public constant NAME = "Demo";
    bytes32 public constant ROLE = keccak256("DEMO_ROLE");

    address public immutable owner;
    uint256 public immutable deployedAt;
    uint256 public immutable cap;

    uint256 public minted;

    constructor(uint256 _cap) {
        require(_cap <= MAX_SUPPLY, "cap too high");
        owner = msg.sender;
        deployedAt = block.timestamp;
        cap = _cap;
    }

    function mint(uint256 amount) external {
        require(msg.sender == owner, "not owner");
        require(minted + amount <= cap, "cap exceeded");
        minted += amount;
    }

    function remaining() external view returns (uint256) {
        return cap - minted;
    }
}
