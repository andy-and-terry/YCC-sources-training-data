// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Registry {
    enum Status { Pending, Active, Closed }

    struct Item {
        uint64 id;
        address owner;
        Status status;
        string label;
    }

    Item[] public items;
    mapping(uint64 => uint256) private indexOf;
    mapping(address => uint64[]) public byOwner;

    function create(string calldata label) external returns (uint64 id) {
        id = uint64(items.length + 1);
        items.push(Item(id, msg.sender, Status.Pending, label));
        indexOf[id] = items.length - 1;
        byOwner[msg.sender].push(id);
    }

    function activate(uint64 id) external {
        Item storage it = items[indexOf[id]];
        require(it.owner == msg.sender, "not owner");
        require(it.status == Status.Pending, "bad state");
        it.status = Status.Active;
    }

    function countByStatus(Status s) external view returns (uint256 n) {
        for (uint256 i = 0; i < items.length; ++i) if (items[i].status == s) ++n;
    }

    function labels() external view returns (string[] memory out) {
        out = new string[](items.length);
        for (uint256 i = 0; i < items.length; i++) out[i] = items[i].label;
    }
}
