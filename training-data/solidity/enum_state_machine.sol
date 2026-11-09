// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    enum State { Created, Funded, Released }
    State public state;
    function fund() external { require(state == State.Created); state = State.Funded; }
    function release() external { require(state == State.Funded); state = State.Released; }
}
