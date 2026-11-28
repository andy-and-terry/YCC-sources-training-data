// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Fixed-point secant method (1e18 scale) for f(x) = x^2 - 2.
contract IntegerSqrtSecant {
    int256 constant ONE = 1e18;

    function f(int256 x) internal pure returns (int256) {
        return (x * x) / ONE - 2 * ONE;
    }

    function root() public pure returns (int256) {
        int256 x0 = ONE;
        int256 x1 = 2 * ONE;
        for (uint256 i = 0; i < 50; i++) {
            int256 f0 = f(x0);
            int256 f1 = f(x1);
            if (f1 == f0) break;
            int256 next = x1 - (f1 * (x1 - x0)) / (f1 - f0);
            x0 = x1;
            x1 = next;
        }
        return x1;
    }
}
