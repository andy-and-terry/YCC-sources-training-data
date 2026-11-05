// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Crowdfund {
    enum State { Open, Funded, Closed }
    State public state = State.Open;

    function fund() external { require(state == State.Open); state = State.Funded; }
    function close() external { require(state == State.Funded); state = State.Closed; }
}
