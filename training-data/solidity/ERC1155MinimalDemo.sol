// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC1155MinimalDemo {
    mapping(uint256 => mapping(address => uint256)) public balanceOf;
    mapping(address => mapping(address => bool)) public isApprovedForAll;
    address public minter;

    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 amount);
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);

    constructor() {
        minter = msg.sender;
    }

    function mint(address to, uint256 id, uint256 amount) external {
        require(msg.sender == minter, "not minter");
        balanceOf[id][to] += amount;
        emit TransferSingle(msg.sender, address(0), to, id, amount);
    }

    function setApprovalForAll(address operator, bool approved) external {
        isApprovedForAll[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount) external {
        require(from == msg.sender || isApprovedForAll[from][msg.sender], "not authorized");
        require(balanceOf[id][from] >= amount, "insufficient balance");

        balanceOf[id][from] -= amount;
        balanceOf[id][to] += amount;
        emit TransferSingle(msg.sender, from, to, id, amount);
    }

    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids)
        external
        view
        returns (uint256[] memory batchBalances)
    {
        require(accounts.length == ids.length, "length mismatch");
        batchBalances = new uint256[](accounts.length);
        for (uint256 i = 0; i < accounts.length; i++) {
            batchBalances[i] = balanceOf[ids[i]][accounts[i]];
        }
    }
}
