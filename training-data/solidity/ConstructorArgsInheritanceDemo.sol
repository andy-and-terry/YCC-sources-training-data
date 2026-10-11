// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Named {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Versioned {
    uint256 public version;

    constructor(uint256 _version) {
        version = _version;
    }
}

contract Product is Named("widget"), Versioned {
    uint256 public price;

    constructor(uint256 _price) Versioned(3) {
        price = _price;
    }
}
