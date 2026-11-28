// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SqrtDecomposition {
    uint256 public immutable blockSize;
    uint256[] public values;
    uint256[] public blockSums;

    constructor(uint256[] memory v, uint256 bs) {
        blockSize = bs;
        values = v;
        blockSums = new uint256[]((v.length + bs - 1) / bs);
        for (uint256 i = 0; i < v.length; i++) blockSums[i / bs] += v[i];
    }

    function query(uint256 l, uint256 r) external view returns (uint256 s) {
        uint256 i = l;
        while (i <= r) {
            if (i % blockSize == 0 && i + blockSize - 1 <= r) {
                s += blockSums[i / blockSize];
                i += blockSize;
            } else {
                s += values[i++];
            }
        }
    }
}
