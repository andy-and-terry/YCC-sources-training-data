// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DeltaEncoding {
    function encode(int[] memory xs) public pure returns (int[] memory d) {
        d = new int[](xs.length);
        d[0] = xs[0];
        for (uint i = 1; i < xs.length; i++) d[i] = xs[i] - xs[i - 1];
    }

    function decode(int[] memory ds) public pure returns (int[] memory out) {
        out = new int[](ds.length);
        int acc = 0;
        for (uint i = 0; i < ds.length; i++) {
            acc += ds[i];
            out[i] = acc;
        }
    }
}
