// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Registry {
    struct User { string name; uint8 age; }
    User[] public users;

    function add(string calldata n, uint8 a) external returns (uint256) {
        users.push(User(n, a));
        return users.length - 1;
    }

    function oldest() external view returns (string memory) {
        uint256 best;
        for (uint256 i = 1; i < users.length; i++) {
            if (users[i].age > users[best].age) best = i;
        }
        return users[best].name;
    }
}
