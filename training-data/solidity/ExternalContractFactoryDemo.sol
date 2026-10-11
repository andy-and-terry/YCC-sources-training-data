// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Child {
    address public parent;
    uint256 public id;

    constructor(uint256 _id) {
        parent = msg.sender;
        id = _id;
    }
}

contract ExternalContractFactoryDemo {
    Child[] public children;

    event ChildCreated(address indexed child, uint256 id);

    function create() external returns (Child c) {
        c = new Child(children.length);
        children.push(c);
        emit ChildCreated(address(c), c.id());
    }

    function count() external view returns (uint256) {
        return children.length;
    }
}
