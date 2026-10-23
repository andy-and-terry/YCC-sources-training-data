// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumStageMachineModifierDemo {
    enum Stage { Created, Funded, Shipped, Delivered }
    Stage public stage = Stage.Created;

    modifier atStage(Stage s) {
        require(stage == s, "wrong stage");
        _;
    }

    function fund() external atStage(Stage.Created) { stage = Stage.Funded; }
    function ship() external atStage(Stage.Funded) { stage = Stage.Shipped; }
    function deliver() external atStage(Stage.Shipped) { stage = Stage.Delivered; }
}
