// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NestedStructUpdateDemo {
    struct Address {
        string city;
        uint32 zip;
    }

    struct Person {
        string name;
        Address home;
        uint8 age;
    }

    mapping(uint256 => Person) public people;

    function create(uint256 id, string calldata name, string calldata city, uint32 zip, uint8 age) external {
        people[id] = Person(name, Address(city, zip), age);
    }

    function move(uint256 id, string calldata city, uint32 zip) external {
        Person storage p = people[id];
        p.home.city = city;
        p.home.zip = zip;
    }

    function birthday(uint256 id) external {
        people[id].age += 1;
    }
}
