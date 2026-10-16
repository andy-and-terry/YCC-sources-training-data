// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BytesConcatSliceDemo {
    function join(bytes memory a, bytes memory b) public pure returns (bytes memory) {
        return bytes.concat(a, b);
    }

    function head(bytes calldata data, uint256 n) external pure returns (bytes memory) {
        return data[:n];
    }

    function tail(bytes calldata data, uint256 from) external pure returns (bytes memory) {
        return data[from:];
    }

    function selector(bytes calldata data) external pure returns (bytes4) {
        return bytes4(data[:4]);
    }
}
