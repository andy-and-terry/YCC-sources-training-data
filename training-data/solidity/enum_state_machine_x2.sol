// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Order {
    enum State { Created, Paid, Shipped }
    State public state;
    function pay() external { require(state == State.Created); state = State.Paid; }
    function ship() external { require(state == State.Paid); state = State.Shipped; }
}
