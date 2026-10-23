// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceFeed {
    uint256 public price = 1500;

    function quote(uint256 amount) external view returns (uint256) {
        return amount * price;
    }

    function setPrice(uint256 p) external {
        price = p;
    }
}

// staticcall forbids state changes in the callee, so it is safe for read-only queries.
contract StaticCallReadOnlyDemo {
    function readQuote(address feed, uint256 amount) external view returns (bool ok, uint256 result) {
        (bool success, bytes memory data) = feed.staticcall(
            abi.encodeWithSignature("quote(uint256)", amount)
        );
        if (!success) {
            return (false, 0);
        }
        return (true, abi.decode(data, (uint256)));
    }

    // Attempting a state-changing function through staticcall fails and returns false.
    function trySetPrice(address feed, uint256 p) external view returns (bool) {
        (bool success, ) = feed.staticcall(abi.encodeWithSignature("setPrice(uint256)", p));
        return success;
    }
}
