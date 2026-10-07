// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A minimal ERC-20-style token with checkpointed balances: callers can
// query an account's balance as of any past block, which is the
// building block behind on-chain governance voting power.
contract ERC20SnapshotDemo {
    struct Checkpoint {
        uint256 blockNumber;
        uint256 balance;
    }

    string public name = "SnapshotToken";
    mapping(address => uint256) public balanceOf;
    mapping(address => Checkpoint[]) private checkpoints;

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
        _writeCheckpoint(msg.sender, initialSupply);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balanceOf[msg.sender] >= amount, "insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        _writeCheckpoint(msg.sender, balanceOf[msg.sender]);
        _writeCheckpoint(to, balanceOf[to]);
        return true;
    }

    function _writeCheckpoint(address account, uint256 newBalance) private {
        Checkpoint[] storage history = checkpoints[account];
        if (history.length > 0 && history[history.length - 1].blockNumber == block.number) {
            history[history.length - 1].balance = newBalance;
        } else {
            history.push(Checkpoint({blockNumber: block.number, balance: newBalance}));
        }
    }

    function balanceAt(address account, uint256 blockNumber) external view returns (uint256) {
        Checkpoint[] storage history = checkpoints[account];
        if (history.length == 0 || blockNumber < history[0].blockNumber) return 0;

        uint256 lo = 0;
        uint256 hi = history.length - 1;
        while (lo < hi) {
            uint256 mid = (lo + hi + 1) / 2;
            if (history[mid].blockNumber <= blockNumber) {
                lo = mid;
            } else {
                hi = mid - 1;
            }
        }
        return history[lo].balance;
    }
}
