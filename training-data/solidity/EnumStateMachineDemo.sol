// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumStateMachineDemo {
    enum State { Created, Active, Closed }

    State public state = State.Created;

    modifier inState(State expected) {
        require(state == expected, "Invalid state");
        _;
    }

    function activate() external inState(State.Created) {
        state = State.Active;
    }

    function close() external inState(State.Active) {
        state = State.Closed;
    }
}
