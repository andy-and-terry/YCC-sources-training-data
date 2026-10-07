// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Singly linked list stored in a mapping, keyed by auto-incrementing
// node ids. Node id 0 is reserved as the "null" sentinel.
library LinkedListLib {
    struct Node {
        uint256 value;
        uint256 next;
    }

    struct List {
        mapping(uint256 => Node) nodes;
        uint256 head;
        uint256 length;
        uint256 nextId;
    }

    function pushFront(List storage list, uint256 value) internal returns (uint256 id) {
        list.nextId += 1;
        id = list.nextId;
        list.nodes[id] = Node({ value: value, next: list.head });
        list.head = id;
        list.length += 1;
    }

    function removeFront(List storage list) internal returns (uint256 value) {
        require(list.length > 0, "list is empty");
        Node storage front = list.nodes[list.head];
        value = front.value;
        uint256 oldHead = list.head;
        list.head = front.next;
        delete list.nodes[oldHead];
        list.length -= 1;
    }

    function toArray(List storage list) internal view returns (uint256[] memory values) {
        values = new uint256[](list.length);
        uint256 current = list.head;
        for (uint256 i = 0; i < list.length; i++) {
            values[i] = list.nodes[current].value;
            current = list.nodes[current].next;
        }
    }
}

contract LinkedListDemo {
    using LinkedListLib for LinkedListLib.List;

    LinkedListLib.List private list;

    function pushFront(uint256 value) external returns (uint256 id) {
        return list.pushFront(value);
    }

    function removeFront() external returns (uint256 value) {
        return list.removeFront();
    }

    function length() external view returns (uint256) {
        return list.length;
    }

    function values() external view returns (uint256[] memory) {
        return list.toArray();
    }
}
