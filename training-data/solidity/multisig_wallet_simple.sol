// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSig {
    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public required;

    struct Tx { address to; uint256 value; bytes data; bool executed; uint256 approvals; }
    Tx[] public txs;
    mapping(uint256 => mapping(address => bool)) public approved;

    event Submitted(uint256 indexed id);
    event Approved(uint256 indexed id, address indexed owner);
    event Executed(uint256 indexed id);

    modifier onlyOwner() { require(isOwner[msg.sender], "not owner"); _; }

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length >= _required && _required > 0, "bad config");
        for (uint256 i = 0; i < _owners.length; i++) {
            require(!isOwner[_owners[i]] && _owners[i] != address(0), "bad owner");
            isOwner[_owners[i]] = true;
            owners.push(_owners[i]);
        }
        required = _required;
    }

    receive() external payable {}

    function submit(address to, uint256 value, bytes calldata data) external onlyOwner returns (uint256 id) {
        id = txs.length;
        txs.push(Tx(to, value, data, false, 0));
        emit Submitted(id);
    }

    function approve(uint256 id) external onlyOwner {
        require(!approved[id][msg.sender], "already");
        approved[id][msg.sender] = true;
        txs[id].approvals++;
        emit Approved(id, msg.sender);
    }

    function execute(uint256 id) external onlyOwner {
        Tx storage t = txs[id];
        require(!t.executed && t.approvals >= required, "cannot execute");
        t.executed = true;
        (bool ok, ) = t.to.call{value: t.value}(t.data);
        require(ok, "call failed");
        emit Executed(id);
    }
}
