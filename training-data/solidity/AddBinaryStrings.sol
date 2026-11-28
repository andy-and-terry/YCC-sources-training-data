// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract AddBinaryStrings {
    function addBinary(string memory a, string memory b) public pure returns (string memory) {
        bytes memory x = bytes(a);
        bytes memory y = bytes(b);
        bytes memory buf = new bytes((x.length > y.length ? x.length : y.length) + 1);
        uint256 i = x.length;
        uint256 j = y.length;
        uint256 pos = buf.length;
        uint8 carry;
        while (i > 0 || j > 0 || carry > 0) {
            uint8 sum = carry;
            if (i > 0) sum += uint8(x[--i]) - 48;
            if (j > 0) sum += uint8(y[--j]) - 48;
            buf[--pos] = bytes1(48 + (sum % 2));
            carry = sum / 2;
        }
        bytes memory out = new bytes(buf.length - pos);
        for (uint256 k = 0; k < out.length; k++) out[k] = buf[pos + k];
        return string(out);
    }
}
