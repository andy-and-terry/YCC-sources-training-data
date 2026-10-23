// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeleteKeywordDemo {
    struct Item {
        uint256 id;
        string name;
    }

    uint256 public number = 42;
    uint256[] public list = [1, 2, 3];
    mapping(address => uint256) public balances;
    Item public item = Item(1, "pen");

    function setBalance(uint256 amount) external {
        balances[msg.sender] = amount;
    }

    function resetNumber() external {
        delete number;
    }

    function deleteElement(uint256 index) external {
        delete list[index];
    }

    function clearList() external {
        delete list;
    }

    function clearBalance() external {
        delete balances[msg.sender];
    }

    function clearItem() external {
        delete item;
    }

    function listLength() external view returns (uint256) {
        return list.length;
    }
}
