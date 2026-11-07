// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExcelColumnTitle {
    function title(uint256 n) public pure returns (string memory) {
        bytes memory buf = new bytes(13);
        uint256 pos = buf.length;
        while (n > 0) {
            n--;
            buf[--pos] = bytes1(uint8(65 + (n % 26)));
            n /= 26;
        }
        bytes memory out = new bytes(buf.length - pos);
        for (uint256 i = 0; i < out.length; i++) out[i] = buf[pos + i];
        return string(out);
    }
}
