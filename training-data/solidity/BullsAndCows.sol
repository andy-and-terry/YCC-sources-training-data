// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Bulls and Cows scoring for equal-length digit strings.
contract BullsAndCows {
    function score(bytes memory secret, bytes memory guess)
        external
        pure
        returns (uint256 bulls, uint256 cows)
    {
        require(secret.length == guess.length, "length mismatch");
        uint256[10] memory sc;
        uint256[10] memory gc;
        for (uint256 i = 0; i < secret.length; i++) {
            if (secret[i] == guess[i]) {
                bulls++;
            } else {
                sc[uint8(secret[i]) - 48]++;
                gc[uint8(guess[i]) - 48]++;
            }
        }
        for (uint256 d = 0; d < 10; d++) {
            cows += sc[d] < gc[d] ? sc[d] : gc[d];
        }
    }
}
