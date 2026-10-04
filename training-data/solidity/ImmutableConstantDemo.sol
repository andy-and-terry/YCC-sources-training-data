// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ImmutableConstantDemo {
    uint256 public constant MAX_SUPPLY = 10_000;
    uint256 public constant FEE_BPS = 250;
    bytes32 public constant ROLE = keccak256("ADMIN_ROLE");

    address public immutable deployer;
    uint256 public immutable createdAt;
    uint256 public immutable cap;

    constructor(uint256 _cap) {
        require(_cap <= MAX_SUPPLY, "cap too high");
        deployer = msg.sender;
        createdAt = block.timestamp;
        cap = _cap;
    }

    function feeOn(uint256 amount) external pure returns (uint256) {
        return (amount * FEE_BPS) / 10_000;
    }

    function age() external view returns (uint256) {
        return block.timestamp - createdAt;
    }
}
