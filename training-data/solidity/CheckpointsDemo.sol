// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CheckpointsDemo {
    struct Checkpoint {
        uint48 blockNumber;
        uint208 value;
    }

    mapping(address => Checkpoint[]) private history;

    function record(uint208 value) external {
        history[msg.sender].push(Checkpoint(uint48(block.number), value));
    }

    function latest(address user) external view returns (uint208) {
        uint256 n = history[user].length;
        return n == 0 ? 0 : history[user][n - 1].value;
    }

    // Binary search for the value at a past block
    function valueAt(address user, uint256 blockNumber) external view returns (uint208) {
        Checkpoint[] storage ckpts = history[user];
        uint256 low = 0;
        uint256 high = ckpts.length;
        while (low < high) {
            uint256 mid = (low + high) / 2;
            if (ckpts[mid].blockNumber > blockNumber) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }
        return low == 0 ? 0 : ckpts[low - 1].value;
    }
}
