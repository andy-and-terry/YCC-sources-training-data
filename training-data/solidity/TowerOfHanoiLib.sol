// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TowerOfHanoiLib {
    event Move(uint8 disk, uint8 from, uint8 to);

    function moveCount(uint8 disks) public pure returns (uint256) {
        return (uint256(1) << disks) - 1;
    }

    function solve(uint8 disks) external returns (uint256 moves) {
        require(disks <= 10, "too many disks");
        _move(disks, 1, 3, 2);
        return moveCount(disks);
    }

    function _move(uint8 n, uint8 from, uint8 to, uint8 via) private {
        if (n == 0) return;
        _move(n - 1, from, via, to);
        emit Move(n, from, to);
        _move(n - 1, via, to, from);
    }
}
