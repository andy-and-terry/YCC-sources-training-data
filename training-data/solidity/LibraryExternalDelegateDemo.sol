// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Accumulator {
    struct Data {
        uint256 total;
        uint256 count;
    }

    function add(Data storage d, uint256 x) external {
        d.total += x;
        d.count++;
    }

    function average(Data storage d) external view returns (uint256) {
        return d.count == 0 ? 0 : d.total / d.count;
    }
}

contract LibraryExternalDelegateDemo {
    Accumulator.Data private acc;

    function push(uint256 x) external {
        Accumulator.add(acc, x);
    }

    function avg() external view returns (uint256) {
        return Accumulator.average(acc);
    }
}
