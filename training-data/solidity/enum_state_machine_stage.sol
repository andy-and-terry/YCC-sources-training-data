// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Stages {
    enum Stage { Init, Active, Done }
    Stage public stage;
    function next() external { require(stage != Stage.Done, "done"); stage = Stage(uint(stage) + 1); }
}
