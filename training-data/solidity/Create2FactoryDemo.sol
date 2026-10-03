// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Deploys a minimal child contract to a deterministic address using
// CREATE2, so callers can predict an address before deployment.
contract Deployable {
    address public creator;
    uint256 public value;

    constructor(uint256 _value) {
        creator = msg.sender;
        value = _value;
    }
}

contract Create2FactoryDemo {
    event Deployed(address addr, uint256 salt);

    function deploy(uint256 salt, uint256 value) external returns (address addr) {
        bytes memory bytecode = abi.encodePacked(type(Deployable).creationCode, abi.encode(value));
        addr = Create2.deploy(salt, bytecode);
        emit Deployed(addr, salt);
    }

    function computeAddress(uint256 salt, uint256 value) external view returns (address) {
        bytes memory bytecode = abi.encodePacked(type(Deployable).creationCode, abi.encode(value));
        bytes32 bytecodeHash = keccak256(bytecode);
        return address(
            uint160(
                uint256(
                    keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, bytecodeHash))
                )
            )
        );
    }
}

library Create2 {
    function deploy(uint256 salt, bytes memory bytecode) internal returns (address addr) {
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }
    }
}
