// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simple raffle: anyone can buy a ticket by sending the entry fee,
// and the owner draws a winner who takes the whole pot. The "random"
// pick below is derived from block data and is NOT secure against a
// miner or validator who can bias it; it is illustrative only.
contract RaffleLotteryDemo {
    address public owner;
    uint256 public constant TICKET_PRICE = 0.01 ether;
    address[] public players;

    event TicketBought(address indexed player, uint256 ticketNumber);
    event WinnerPaid(address indexed winner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function buyTicket() external payable {
        require(msg.value == TICKET_PRICE, "wrong ticket price");
        players.push(msg.sender);
        emit TicketBought(msg.sender, players.length - 1);
    }

    function playerCount() external view returns (uint256) {
        return players.length;
    }

    function drawWinner() external onlyOwner {
        require(players.length > 0, "no players");

        uint256 randomIndex = uint256(
            keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length))
        ) % players.length;
        address winner = players[randomIndex];
        uint256 prize = address(this).balance;

        delete players;
        emit WinnerPaid(winner, prize);

        (bool success, ) = winner.call{ value: prize }("");
        require(success, "prize transfer failed");
    }
}
