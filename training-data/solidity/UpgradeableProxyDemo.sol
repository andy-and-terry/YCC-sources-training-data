// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UpgradeableProxyDemo {
    bytes32 private constant IMPLEMENTATION_SLOT =
        keccak256("upgradeable.proxy.implementation");
    address public admin;

    constructor(address _implementation) {
        admin = msg.sender;
        _setImplementation(_implementation);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "not admin");
        _;
    }

    function implementation() public view returns (address impl) {
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            impl := sload(slot)
        }
    }

    function _setImplementation(address _implementation) internal {
        require(_implementation != address(0), "zero implementation");
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            sstore(slot, _implementation)
        }
    }

    function upgradeTo(address _newImplementation) external onlyAdmin {
        _setImplementation(_newImplementation);
    }

    fallback() external payable {
        address impl = implementation();
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }

    receive() external payable {}
}
