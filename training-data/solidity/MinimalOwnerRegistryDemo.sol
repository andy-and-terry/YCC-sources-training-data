// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MinimalOwnerRegistryDemo {
    mapping(bytes32 => address) public ownerOf;

    event Registered(bytes32 indexed key, address indexed owner);
    event Transferred(bytes32 indexed key, address indexed from, address indexed to);

    function register(string calldata name) external {
        bytes32 key = keccak256(bytes(name));
        require(ownerOf[key] == address(0), "taken");
        ownerOf[key] = msg.sender;
        emit Registered(key, msg.sender);
    }

    function transfer(string calldata name, address to) external {
        bytes32 key = keccak256(bytes(name));
        require(ownerOf[key] == msg.sender, "not owner");
        ownerOf[key] = to;
        emit Transferred(key, msg.sender, to);
    }
}
