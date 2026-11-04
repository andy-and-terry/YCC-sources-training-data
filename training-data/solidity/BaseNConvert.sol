// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseNConvert {
    bytes constant DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz";

    function toBase(uint256 n, uint8 base) public pure returns (string memory) {
        require(base >= 2 && base <= 36, "bad base");
        if (n == 0) return "0";
        bytes memory buf = new bytes(256);
        uint256 i = 256;
        while (n > 0) {
            buf[--i] = DIGITS[n % base];
            n /= base;
        }
        bytes memory out = new bytes(256 - i);
        for (uint256 j = 0; j < out.length; j++) out[j] = buf[i + j];
        return string(out);
    }
}
