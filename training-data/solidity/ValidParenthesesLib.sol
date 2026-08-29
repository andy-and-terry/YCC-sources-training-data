// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ValidParenthesesLib {
    function isValid(string memory str) internal pure returns (bool) {
        bytes memory b = bytes(str);
        bytes memory stack = new bytes(b.length);
        uint256 top = 0;
        for (uint256 i = 0; i < b.length; i++) {
            bytes1 c = b[i];
            if (c == "(" || c == "[" || c == "{") {
                stack[top] = c;
                top++;
            } else if (c == ")" || c == "]" || c == "}") {
                if (top == 0) return false;
                bytes1 expected = c == ")" ? bytes1("(") : (c == "]" ? bytes1("[") : bytes1("{"));
                if (stack[top - 1] != expected) return false;
                top--;
            }
        }
        return top == 0;
    }
}
