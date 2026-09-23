// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // block.prevrandao requires 0.8.18+

// A simple pot-style lottery: anyone can enter for a fixed fee, and
// the owner draws a winner who takes the whole pot. NOTE: the "random"
// pick below is derived from block data and is trivially predictable
// or manipulable by a miner/validator -- fine for a demo, never for a
// real lottery holding real value (use a verifiable randomness oracle
// such as Chainlink VRF instead).
contract LotteryDemo {
    address public owner;
    address[] public players;
    uint256 public constant TICKET_PRICE = 0.01 ether;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function enter() external payable {
        require(msg.value == TICKET_PRICE, "wrong ticket price");
        players.push(msg.sender);
    }

    function playerCount() external view returns (uint256) {
        return players.length;
    }

    function pickWinner() external onlyOwner returns (address winner) {
        require(players.length > 0, "no players");
        uint256 index = uint256(
            keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length))
        ) % players.length;
        winner = players[index];

        uint256 pot = address(this).balance;
        delete players;

        (bool sent, ) = winner.call{value: pot}("");
        require(sent, "payout failed");
    }
}
