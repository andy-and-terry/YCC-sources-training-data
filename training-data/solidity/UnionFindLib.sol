// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnionFindLib {
    uint256[] public parent;

    constructor(uint256 n) {
        for (uint256 i = 0; i < n; i++) {
            parent.push(i);
        }
    }

    function find(uint256 x) public view returns (uint256) {
        if (parent[x] == x) return x;
        return find(parent[x]);
    }

    function union(uint256 x, uint256 y) external {
        uint256 rootX = find(x);
        uint256 rootY = find(y);
        if (rootX != rootY) {
            parent[rootX] = rootY;
        }
    }
}
