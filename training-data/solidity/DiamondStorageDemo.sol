// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// "Diamond storage" (EIP-2535) stores a whole struct at a
// deterministic, collision-resistant slot computed from a namespace
// string, rather than relying on the compiler's sequential storage
// layout. This is what lets independently-compiled facets of a
// diamond proxy share state safely.
contract DiamondStorageDemo {
    bytes32 private constant APP_STORAGE_POSITION = keccak256("diamond.storage.app");

    struct AppStorage {
        uint256 totalDeposits;
        mapping(address => uint256) balances;
    }

    function _appStorage() internal pure returns (AppStorage storage s) {
        bytes32 position = APP_STORAGE_POSITION;
        assembly {
            s.slot := position
        }
    }

    function deposit() external payable {
        AppStorage storage s = _appStorage();
        s.balances[msg.sender] += msg.value;
        s.totalDeposits += msg.value;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _appStorage().balances[account];
    }

    function totalDeposits() external view returns (uint256) {
        return _appStorage().totalDeposits;
    }
}
