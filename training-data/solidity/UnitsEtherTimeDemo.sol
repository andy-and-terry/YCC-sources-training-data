// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Literal suffixes: wei, gwei, ether and seconds, minutes, hours, days, weeks.
contract UnitsEtherTimeDemo {
    function etherUnits() external pure returns (uint256 weiAmt, uint256 gweiAmt, uint256 etherAmt) {
        weiAmt = 1 wei;
        gweiAmt = 1 gwei;       // 1e9
        etherAmt = 1 ether;     // 1e18
    }

    function isOneEtherEqual() external pure returns (bool) {
        return 1 ether == 1e18 && 1 gwei == 1000 * 1 wei * 1e6;
    }

    function timeUnits() external pure returns (uint256 m, uint256 h, uint256 d, uint256 w) {
        m = 1 minutes;  // 60
        h = 1 hours;    // 3600
        d = 1 days;     // 86400
        w = 1 weeks;    // 604800
    }

    function deadline(uint256 numDays) external view returns (uint256) {
        return block.timestamp + numDays * 1 days;
    }

    function halfEther() external pure returns (uint256) {
        return 0.5 ether;       // fractional literals are allowed before conversion
    }
}
