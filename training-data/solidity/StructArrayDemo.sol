// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructArrayDemo {
    struct Person {
        string name;
        uint256 age;
    }

    Person[] public people;

    function addPerson(string calldata name, uint256 age) external {
        people.push(Person(name, age));
    }

    function totalAge() external view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < people.length; i++) {
            total += people[i].age;
        }
        return total;
    }

    function count() external view returns (uint256) {
        return people.length;
    }
}
