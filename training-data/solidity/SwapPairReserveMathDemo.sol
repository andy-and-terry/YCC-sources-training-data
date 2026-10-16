// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SwapPairReserveMathDemo {
    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut)
        public
        pure
        returns (uint256)
    {
        require(amountIn > 0, "zero input");
        require(reserveIn > 0 && reserveOut > 0, "empty reserves");
        uint256 inWithFee = amountIn * 997;
        return (inWithFee * reserveOut) / (reserveIn * 1000 + inWithFee);
    }

    function quote(uint256 amountA, uint256 reserveA, uint256 reserveB) public pure returns (uint256) {
        require(amountA > 0 && reserveA > 0, "bad input");
        return (amountA * reserveB) / reserveA;
    }
}
