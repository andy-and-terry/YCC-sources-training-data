// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAMMDemo {
    uint256 public reserveA;
    uint256 public reserveB;
    mapping(address => uint256) public liquidityShares;
    uint256 public totalShares;

    event LiquidityAdded(address indexed provider, uint256 amountA, uint256 amountB, uint256 shares);
    event Swapped(address indexed trader, uint256 amountIn, uint256 amountOut, bool aToB);

    function addLiquidity(uint256 amountA, uint256 amountB) external {
        require(amountA > 0 && amountB > 0, "amounts must be positive");

        uint256 shares;
        if (totalShares == 0) {
            shares = sqrt(amountA * amountB);
        } else {
            uint256 shareA = (amountA * totalShares) / reserveA;
            uint256 shareB = (amountB * totalShares) / reserveB;
            shares = shareA < shareB ? shareA : shareB;
        }
        require(shares > 0, "insufficient liquidity minted");

        reserveA += amountA;
        reserveB += amountB;
        liquidityShares[msg.sender] += shares;
        totalShares += shares;

        emit LiquidityAdded(msg.sender, amountA, amountB, shares);
    }

    function swapAForB(uint256 amountAIn) external returns (uint256 amountBOut) {
        require(amountAIn > 0, "amount must be positive");
        require(reserveA > 0 && reserveB > 0, "no liquidity");

        uint256 amountInWithFee = amountAIn * 997;
        amountBOut = (amountInWithFee * reserveB) / (reserveA * 1000 + amountInWithFee);
        require(amountBOut > 0 && amountBOut < reserveB, "insufficient output");

        reserveA += amountAIn;
        reserveB -= amountBOut;

        emit Swapped(msg.sender, amountAIn, amountBOut, true);
    }

    function sqrt(uint256 x) internal pure returns (uint256 y) {
        if (x == 0) return 0;
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}
