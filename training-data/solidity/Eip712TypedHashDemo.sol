// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Builds an EIP-712 typed-data digest and verifies a signed "Mail" message.
contract Eip712TypedHashDemo {
    struct Mail {
        address from;
        address to;
        string contents;
    }

    bytes32 private constant DOMAIN_TYPEHASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");
    bytes32 private constant MAIL_TYPEHASH =
        keccak256("Mail(address from,address to,string contents)");

    bytes32 public immutable DOMAIN_SEPARATOR;

    constructor() {
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                DOMAIN_TYPEHASH,
                keccak256(bytes("Mailer")),
                keccak256(bytes("1")),
                block.chainid,
                address(this)
            )
        );
    }

    function hashMail(Mail calldata mail) public pure returns (bytes32) {
        return keccak256(
            abi.encode(MAIL_TYPEHASH, mail.from, mail.to, keccak256(bytes(mail.contents)))
        );
    }

    function digest(Mail calldata mail) public view returns (bytes32) {
        return keccak256(abi.encodePacked("\x19\x01", DOMAIN_SEPARATOR, hashMail(mail)));
    }

    function verify(Mail calldata mail, uint8 v, bytes32 r, bytes32 s) external view returns (bool) {
        address signer = ecrecover(digest(mail), v, r, s);
        return signer != address(0) && signer == mail.from;
    }
}
