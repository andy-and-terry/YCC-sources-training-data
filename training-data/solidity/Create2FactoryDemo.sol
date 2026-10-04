// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    address public immutable owner;
    uint256 public immutable id;

    constructor(address _owner, uint256 _id) {
        owner = _owner;
        id = _id;
    }
}

contract Create2FactoryDemo {
    event VaultCreated(address indexed vault, address indexed owner, bytes32 salt);

    address[] public vaults;

    function deploy(bytes32 salt, uint256 id) external returns (address vault) {
        vault = address(new Vault{salt: salt}(msg.sender, id));
        vaults.push(vault);
        emit VaultCreated(vault, msg.sender, salt);
    }

    function predict(bytes32 salt, address owner, uint256 id) external view returns (address) {
        bytes memory initCode = abi.encodePacked(type(Vault).creationCode, abi.encode(owner, id));
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode)));
        return address(uint160(uint256(hash)));
    }

    function vaultCount() external view returns (uint256) {
        return vaults.length;
    }
}
