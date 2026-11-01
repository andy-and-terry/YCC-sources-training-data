// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EnumStateMachineEx {
    enum Stage { Open, Locked, Closed }
    Stage public stage = Stage.Open;

    function advance() external {
        require(stage != Stage.Closed, "closed");
        stage = Stage(uint8(stage) + 1);
    }
}
