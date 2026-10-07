// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Child {
    address public immutable owner;
    uint256 public immutable id;

    constructor(address _owner, uint256 _id) {
        owner = _owner;
        id = _id;
    }
}

contract Create2FactoryDemo {
    event Deployed(address addr, bytes32 salt);

    function deploy(bytes32 salt, uint256 id) external returns (address) {
        Child c = new Child{salt: salt}(msg.sender, id);
        emit Deployed(address(c), salt);
        return address(c);
    }

    function predict(bytes32 salt, uint256 id) external view returns (address) {
        bytes32 initHash = keccak256(abi.encodePacked(type(Child).creationCode, abi.encode(msg.sender, id)));
        bytes32 h = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, initHash));
        return address(uint160(uint256(h)));
    }
}
