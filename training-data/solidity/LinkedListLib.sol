// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice A singly linked list of uint256 values backed by storage
/// mappings, since Solidity has no native pointer-based data structures.
contract LinkedListLib {
    struct Node {
        uint256 value;
        uint256 next;
        bool exists;
    }

    mapping(uint256 => Node) private nodes;
    uint256 private nextId = 1;
    uint256 public head;
    uint256 public tail;
    uint256 public length;

    function pushBack(uint256 value) external returns (uint256 id) {
        id = nextId++;
        nodes[id] = Node({ value: value, next: 0, exists: true });

        if (tail == 0) {
            head = id;
        } else {
            nodes[tail].next = id;
        }
        tail = id;
        length++;
    }

    function popFront() external returns (uint256 value) {
        require(head != 0, "list is empty");
        Node storage front = nodes[head];
        value = front.value;

        uint256 next = front.next;
        delete nodes[head];
        head = next;
        if (head == 0) {
            tail = 0;
        }
        length--;
    }

    function toArray() external view returns (uint256[] memory values) {
        values = new uint256[](length);
        uint256 cursor = head;
        uint256 i = 0;
        while (cursor != 0) {
            values[i] = nodes[cursor].value;
            cursor = nodes[cursor].next;
            i++;
        }
    }
}
