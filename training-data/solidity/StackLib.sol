// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library StackLib {
    struct Stack {
        uint256[] items;
    }

    error EmptyStack();

    function push(Stack storage stack, uint256 value) internal {
        stack.items.push(value);
    }

    function pop(Stack storage stack) internal returns (uint256) {
        if (stack.items.length == 0) revert EmptyStack();
        uint256 top = stack.items[stack.items.length - 1];
        stack.items.pop();
        return top;
    }

    function peek(Stack storage stack) internal view returns (uint256) {
        if (stack.items.length == 0) revert EmptyStack();
        return stack.items[stack.items.length - 1];
    }

    function isEmpty(Stack storage stack) internal view returns (bool) {
        return stack.items.length == 0;
    }
}

contract StackDemo {
    using StackLib for StackLib.Stack;

    StackLib.Stack private stack;

    function push(uint256 value) external {
        stack.push(value);
    }

    function pop() external returns (uint256) {
        return stack.pop();
    }

    function peek() external view returns (uint256) {
        return stack.peek();
    }
}
