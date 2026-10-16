// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PriorityGasRefundBatchDemo {
    mapping(uint256 => bool) public done;

    function markMany(uint256[] calldata ids) external returns (uint256 newlyMarked) {
        uint256 len = ids.length;
        for (uint256 i = 0; i < len; ) {
            uint256 id = ids[i];
            if (!done[id]) {
                done[id] = true;
                newlyMarked++;
            }
            unchecked {
                ++i;
            }
        }
    }

    function gasLeft() external view returns (uint256) {
        return gasleft();
    }
}
