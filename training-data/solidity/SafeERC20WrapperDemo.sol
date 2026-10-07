// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Some ERC-20 tokens return false on failure instead of reverting, and
// some (like USDT) don't return a bool at all. SafeTransferLib handles
// both by checking the call succeeded and, if data was returned, that
// it decodes to true.
interface IERC20Like {
    function transfer(address to, uint256 amount) external returns (bool);
}

library SafeTransferLib {
    error TransferFailed();

    function safeTransfer(IERC20Like token, address to, uint256 amount) internal {
        (bool success, bytes memory data) =
            address(token).call(abi.encodeWithSelector(IERC20Like.transfer.selector, to, amount));

        bool ok = success && (data.length == 0 || abi.decode(data, (bool)));
        if (!ok) revert TransferFailed();
    }
}

contract SafeERC20WrapperDemo {
    using SafeTransferLib for IERC20Like;

    function payOut(IERC20Like token, address to, uint256 amount) external {
        token.safeTransfer(to, amount);
    }
}
