// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ReverseArrayLib {
    function reverseInPlace(uint256[] memory arr) internal pure {
        if (arr.length < 2) return;
        uint256 i = 0;
        uint256 j = arr.length - 1;
        while (i < j) {
            (arr[i], arr[j]) = (arr[j], arr[i]);
            i++;
            j--;
        }
    }
}

contract ReverseArrayDemo {
    function reversed(uint256[] memory input) external pure returns (uint256[] memory) {
        ReverseArrayLib.reverseInPlace(input);
        return input;
    }
}
