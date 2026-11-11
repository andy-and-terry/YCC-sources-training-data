// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract InsertInterval {
    struct Interval {
        uint256 lo;
        uint256 hi;
    }

    function insert(Interval[] memory iv, Interval memory nw) public pure returns (Interval[] memory out) {
        out = new Interval[](iv.length + 1);
        uint256 n;
        uint256 i;
        while (i < iv.length && iv[i].hi < nw.lo) out[n++] = iv[i++];
        while (i < iv.length && iv[i].lo <= nw.hi) {
            if (iv[i].lo < nw.lo) nw.lo = iv[i].lo;
            if (iv[i].hi > nw.hi) nw.hi = iv[i].hi;
            i++;
        }
        out[n++] = nw;
        while (i < iv.length) out[n++] = iv[i++];
        assembly {
            mstore(out, n) // shrink the array length to the used slots
        }
    }
}
