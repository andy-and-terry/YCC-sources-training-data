// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// EIP-165 interface detection: a contract advertises which interfaces
// it implements so callers can check support before interacting.
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface ICounter {
    function increment() external;
    function current() external view returns (uint256);
}

contract ERC165Demo is IERC165, ICounter {
    uint256 private value;

    bytes4 private constant ERC165_ID = type(IERC165).interfaceId;
    bytes4 private constant COUNTER_ID = type(ICounter).interfaceId;

    function increment() external override {
        value += 1;
    }

    function current() external view override returns (uint256) {
        return value;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == ERC165_ID || interfaceId == COUNTER_ID;
    }
}
