// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FourSumCount {
    function count(int256[] memory a, int256[] memory b, int256[] memory c, int256[] memory d)
        public
        pure
        returns (uint256 total)
    {
        // Brute-force pairs: storage mappings are unavailable in pure functions.
        for (uint256 i = 0; i < a.length; i++)
            for (uint256 j = 0; j < b.length; j++)
                for (uint256 k = 0; k < c.length; k++)
                    for (uint256 l = 0; l < d.length; l++)
                        if (a[i] + b[j] + c[k] + d[l] == 0) total++;
    }
}
