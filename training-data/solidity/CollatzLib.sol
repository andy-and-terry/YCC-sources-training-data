// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library CollatzLib {
    function steps(uint256 n) internal pure returns (uint256 count) {
        require(n > 0, "n must be positive");
        while (n != 1) {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            count++;
        }
    }

    function sequence(uint256 n) internal pure returns (uint256[] memory out) {
        out = new uint256[](steps(n) + 1);
        out[0] = n;
        uint256 i = 1;
        while (n != 1) {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            out[i++] = n;
        }
    }
}

contract CollatzDemo {
    function steps(uint256 n) external pure returns (uint256) {
        return CollatzLib.steps(n);
    }

    function sequence(uint256 n) external pure returns (uint256[] memory) {
        return CollatzLib.sequence(n);
    }
}
