// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Kahn's algorithm (BFS via in-degree counting) over a small fixed
// adjacency list supplied in the constructor.
contract TopologicalSortDemo {
    uint256 public n;
    mapping(uint256 => uint256[]) public adjacency;
    uint256[] public inDegree;

    constructor(uint256 _n, uint256[] memory from, uint256[] memory to) {
        require(from.length == to.length, "length mismatch");
        n = _n;
        inDegree = new uint256[](_n);
        for (uint256 i = 0; i < from.length; i++) {
            adjacency[from[i]].push(to[i]);
            inDegree[to[i]]++;
        }
    }

    function sort() external view returns (uint256[] memory order) {
        uint256[] memory degree = new uint256[](n);
        for (uint256 i = 0; i < n; i++) {
            degree[i] = inDegree[i];
        }

        order = new uint256[](n);
        uint256[] memory queue = new uint256[](n);
        uint256 head = 0;
        uint256 tail = 0;

        for (uint256 i = 0; i < n; i++) {
            if (degree[i] == 0) {
                queue[tail++] = i;
            }
        }

        uint256 visited = 0;
        while (head < tail) {
            uint256 u = queue[head++];
            order[visited++] = u;
            uint256[] memory neighbors = adjacency[u];
            for (uint256 k = 0; k < neighbors.length; k++) {
                uint256 v = neighbors[k];
                degree[v]--;
                if (degree[v] == 0) {
                    queue[tail++] = v;
                }
            }
        }

        require(visited == n, "graph has a cycle");
    }
}
