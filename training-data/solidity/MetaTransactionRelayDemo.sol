// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A minimal meta-transaction relayer: a user signs a message off-chain
// authorizing a value transfer, and any relayer can submit it on-chain
// and pay the gas, recovering the true sender via ecrecover instead of
// trusting msg.sender.
contract MetaTransactionRelayDemo {
    mapping(address => uint256) public nonces;
    mapping(address => uint256) public balanceOf;

    event Relayed(address indexed from, address indexed to, uint256 amount, address indexed relayer);

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function executeMetaTransfer(
        address from,
        address to,
        uint256 amount,
        uint256 nonce,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        require(nonce == nonces[from], "bad nonce");

        bytes32 messageHash = keccak256(abi.encodePacked(address(this), from, to, amount, nonce));
        bytes32 ethSignedHash =
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));

        require(ecrecover(ethSignedHash, v, r, s) == from, "invalid signature");
        require(balanceOf[from] >= amount, "insufficient balance");

        nonces[from] = nonce + 1;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;

        emit Relayed(from, to, amount, msg.sender);
    }
}
