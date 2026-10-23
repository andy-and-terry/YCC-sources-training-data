// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Function types as values: internal functions can be passed as callbacks.
contract FunctionTypeCallbackDemo {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function fold(uint256[] memory xs, uint256 init, function(uint256, uint256) internal pure returns (uint256) f)
        internal
        pure
        returns (uint256 acc)
    {
        acc = init;
        for (uint256 i = 0; i < xs.length; i++) {
            acc = f(acc, xs[i]);
        }
    }

    function sum(uint256[] calldata xs) external pure returns (uint256) {
        return fold(xs, 0, add);
    }

    function product(uint256[] calldata xs) external pure returns (uint256) {
        return fold(xs, 1, mul);
    }

    function pick(bool useAdd) external pure returns (uint256) {
        function(uint256, uint256) internal pure returns (uint256) op = useAdd ? add : mul;
        return op(6, 7);
    }
}
