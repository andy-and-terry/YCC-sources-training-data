// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Callee {
    function risky(uint256 x) external pure returns (uint256) {
        require(x != 0, "zero not allowed");
        return 100 / x;
    }
}

contract TryCatchDemo {
    Callee public callee = new Callee();
    event Failed(string reason);
    event FailedRaw(bytes data);

    function attempt(uint256 x) external returns (uint256 result) {
        try callee.risky(x) returns (uint256 r) {
            result = r;
        } catch Error(string memory reason) {
            emit Failed(reason);
        } catch (bytes memory lowLevel) {
            emit FailedRaw(lowLevel);
        }
    }
}
