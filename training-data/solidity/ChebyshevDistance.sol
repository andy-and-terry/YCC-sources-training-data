// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ChebyshevDistance {
    function chebyshev(int256[] calldata a, int256[] calldata b) external pure returns (uint256 m) {
        require(a.length == b.length, "length mismatch");
        for (uint256 i = 0; i < a.length; i++) {
            int256 d = a[i] - b[i];
            uint256 u = uint256(d < 0 ? -d : d);
            if (u > m) m = u;
        }
    }
}
