// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StructArrayEx {
    struct Todo { string text; bool done; }
    Todo[] public todos;

    function add(string calldata t) external { todos.push(Todo(t, false)); }
    function toggle(uint256 i) external { todos[i].done = !todos[i].done; }
    function count() external view returns (uint256) { return todos.length; }
}
