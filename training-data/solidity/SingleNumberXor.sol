// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SingleNumberXor {
    function single(uint256[] memory nums) public pure returns (uint256 acc) {
        for (uint256 i = 0; i < nums.length; i++) acc ^= nums[i];
    }
}
