// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IMath {
    function add(uint256 a, uint256 b) external pure returns (uint256);
}

contract MathImpl is IMath {
    function add(uint256 a, uint256 b) external pure override returns (uint256) {
        return a + b;
    }
}

// abi.encodeCall type-checks the arguments against the function signature at compile time,
// unlike abi.encodeWithSignature, which accepts any string and any values.
contract AbiEncodeCallTypedDemo {
    function encoded(uint256 a, uint256 b) external pure returns (bytes memory) {
        return abi.encodeCall(IMath.add, (a, b));
    }

    function sameAsManual(uint256 a, uint256 b) external pure returns (bool) {
        bytes memory manual = abi.encodeWithSelector(IMath.add.selector, a, b);
        return keccak256(manual) == keccak256(abi.encodeCall(IMath.add, (a, b)));
    }

    function callAdd(address target, uint256 a, uint256 b) external returns (uint256) {
        (bool ok, bytes memory ret) = target.call(abi.encodeCall(IMath.add, (a, b)));
        require(ok, "call failed");
        return abi.decode(ret, (uint256));
    }
}
