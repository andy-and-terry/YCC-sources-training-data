// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sketch of a lock-and-mint bridge: tokens are locked on this chain
// and an event is emitted for an off-chain relayer to mint the
// equivalent amount on the destination chain. Unlocking mirrors the
// same flow for tokens coming back.
interface IERC20Min {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract TokenBridgeLockDemo {
    IERC20Min public immutable token;
    address public relayer;
    mapping(address => uint256) public lockedBalance;

    event Locked(address indexed user, uint256 amount, uint256 destinationChainId);
    event Unlocked(address indexed user, uint256 amount, bytes32 indexed sourceTxHash);

    constructor(address _token, address _relayer) {
        token = IERC20Min(_token);
        relayer = _relayer;
    }

    modifier onlyRelayer() {
        require(msg.sender == relayer, "not relayer");
        _;
    }

    function lock(uint256 amount, uint256 destinationChainId) external {
        require(amount > 0, "zero amount");
        require(token.transferFrom(msg.sender, address(this), amount), "transfer failed");
        lockedBalance[msg.sender] += amount;
        emit Locked(msg.sender, amount, destinationChainId);
    }

    function unlock(address user, uint256 amount, bytes32 sourceTxHash) external onlyRelayer {
        require(lockedBalance[user] >= amount, "insufficient locked balance");
        lockedBalance[user] -= amount;
        emit Unlocked(user, amount, sourceTxHash);
        require(token.transfer(user, amount), "transfer failed");
    }
}
