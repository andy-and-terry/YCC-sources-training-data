// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Base {
    uint256 private secret = 1;
    uint256 internal shared = 2;
    uint256 public open = 3;

    function publicFn() public pure returns (string memory) {
        return "public";
    }

    function externalFn() external pure returns (string memory) {
        return "external";
    }

    function internalFn() internal pure returns (string memory) {
        return "internal";
    }

    function privateFn() private pure returns (string memory) {
        return "private";
    }

    function callPrivate() public pure returns (string memory) {
        return privateFn();
    }

    function readSecret() public view returns (uint256) {
        return secret;
    }
}

contract VisibilityModifiersDemo is Base {
    function readShared() external view returns (uint256) {
        return shared; // internal state is visible to children
    }

    function callInternal() external pure returns (string memory) {
        return internalFn();
    }

    function callPublicInternally() external pure returns (string memory) {
        return publicFn();
    }

    function callExternalViaThis() external view returns (string memory) {
        return this.externalFn();
    }
}
