// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmutableConstantDemo {
    // constants are inlined at compile time; immutables are set once in the constructor.
    uint256 public constant MAX_SUPPLY = 10_000;
    string public constant NAME = "Demo";
    bytes32 public constant ROLE = keccak256("DEMO_ROLE");

    address public immutable deployer;
    uint256 public immutable createdAt;
    uint256 public immutable fee;

    uint256 public minted;

    constructor(uint256 _fee) {
        require(_fee <= 1000, "fee too high");
        deployer = msg.sender;
        createdAt = block.timestamp;
        fee = _fee;
    }

    function mint(uint256 amount) external {
        require(minted + amount <= MAX_SUPPLY, "exceeds max supply");
        minted += amount;
    }

    function feeOn(uint256 amount) external view returns (uint256) {
        return (amount * fee) / 10_000;
    }

    function age() external view returns (uint256) {
        return block.timestamp - createdAt;
    }
}
