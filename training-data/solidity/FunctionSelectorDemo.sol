// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGreeter {
    function greet(string calldata name) external pure returns (string memory);
    function ping() external pure returns (bool);
}

contract FunctionSelectorDemo is IGreeter {
    function greet(string calldata name) external pure override returns (string memory) {
        return string.concat("hello ", name);
    }

    function ping() external pure override returns (bool) {
        return true;
    }

    function selectors() external pure returns (bytes4 greetSel, bytes4 pingSel, bytes4 ifaceId) {
        greetSel = this.greet.selector;
        pingSel = bytes4(keccak256("ping()"));
        ifaceId = type(IGreeter).interfaceId;
    }

    function xorMatches() external pure returns (bool) {
        return type(IGreeter).interfaceId == (this.greet.selector ^ this.ping.selector);
    }

    function callBySelector(string calldata name) external view returns (string memory) {
        (bool ok, bytes memory data) = address(this).staticcall(
            abi.encodeWithSelector(this.greet.selector, name)
        );
        require(ok, "call failed");
        return abi.decode(data, (string));
    }
}
