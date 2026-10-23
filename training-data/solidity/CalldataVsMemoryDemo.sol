// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Data locations for reference-type parameters: calldata is read-only and
// avoids a copy, memory is a mutable copy.
contract CalldataVsMemoryDemo {
    uint256[] public stored;

    // Reads directly from calldata, no copy made.
    function sumCalldata(uint256[] calldata values) external pure returns (uint256 total) {
        for (uint256 i = 0; i < values.length; i++) {
            total += values[i];
        }
    }

    // Copies the array into memory so it can be modified.
    function doubleMemory(uint256[] memory values) public pure returns (uint256[] memory) {
        for (uint256 i = 0; i < values.length; i++) {
            values[i] *= 2;
        }
        return values;
    }

    // Slicing is only available for calldata arrays.
    function sumRange(uint256[] calldata values, uint256 start, uint256 end)
        external
        pure
        returns (uint256 total)
    {
        uint256[] calldata part = values[start:end];
        for (uint256 i = 0; i < part.length; i++) {
            total += part[i];
        }
    }

    function store(uint256[] calldata values) external {
        stored = values; // calldata -> storage copy
    }

    function firstChar(string calldata text) external pure returns (bytes1) {
        return bytes(text)[0];
    }

    function loadAndDouble() external view returns (uint256[] memory) {
        uint256[] memory copy = stored; // storage -> memory copy
        return doubleMemory(copy);
    }
}
