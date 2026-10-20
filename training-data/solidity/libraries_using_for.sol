// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    function max(uint256 a, uint256 b) internal pure returns (uint256) { return a >= b ? a : b; }
    function avg(uint256 a, uint256 b) internal pure returns (uint256) { return (a & b) + ((a ^ b) >> 1); }
    function sqrt(uint256 x) internal pure returns (uint256 y) {
        if (x == 0) return 0;
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) { y = z; z = (x / z + z) / 2; }
    }
}

library ArrayLib {
    function sum(uint256[] memory a) internal pure returns (uint256 s) { for (uint256 i; i < a.length; i++) s += a[i]; }
    function contains(uint256[] storage a, uint256 v) internal view returns (bool) {
        for (uint256 i; i < a.length; i++) if (a[i] == v) return true;
        return false;
    }
}

contract Stats {
    using MathLib for uint256;
    using ArrayLib for uint256[];
    uint256[] public data;
    function add(uint256 v) external { data.push(v); }
    function has(uint256 v) external view returns (bool) { return data.contains(v); }
    function total() external view returns (uint256) { return data.sum(); }
    function root(uint256 x) external pure returns (uint256) { return x.sqrt(); }
    function bigger(uint256 a, uint256 b) external pure returns (uint256) { return a.max(b); }
}
