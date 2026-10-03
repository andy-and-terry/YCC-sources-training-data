// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LinkedListLib {
    uint256 private constant NULL = type(uint256).max;

    mapping(uint256 => uint256) private next;
    uint256 private head = NULL;
    uint256 private count;

    function insertFront(uint256 value) external {
        next[value] = head;
        head = value;
        count++;
    }

    function remove(uint256 value) external returns (bool) {
        if (head == value) {
            head = next[value];
            delete next[value];
            count--;
            return true;
        }
        uint256 current = head;
        while (current != NULL && next[current] != value) {
            current = next[current];
        }
        if (current == NULL) {
            return false;
        }
        next[current] = next[value];
        delete next[value];
        count--;
        return true;
    }

    function contains(uint256 value) external view returns (bool) {
        uint256 current = head;
        while (current != NULL) {
            if (current == value) {
                return true;
            }
            current = next[current];
        }
        return false;
    }

    function toArray() external view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](count);
        uint256 current = head;
        uint256 i = 0;
        while (current != NULL) {
            result[i] = current;
            i++;
            current = next[current];
        }
        return result;
    }

    function size() external view returns (uint256) {
        return count;
    }
}
