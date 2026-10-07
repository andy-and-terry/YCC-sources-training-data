// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Illustrates storage-slot packing: UnpackedRecord's three fields each
// take a full 32-byte slot (3 slots per record), while PackedRecord
// orders its sub-32-byte fields together so the compiler packs all
// three into a single slot, cutting storage writes roughly 3x.
contract StructPackingGasDemo {
    struct UnpackedRecord {
        uint256 id;     // slot N
        uint128 amount; // slot N+1 (wastes the rest of the slot)
        bool active;    // slot N+2 (wastes the rest of the slot)
    }

    struct PackedRecord {
        uint64 id;      // packed into one slot alongside...
        uint128 amount; // ...this...
        bool active;    // ...and this.
    }

    UnpackedRecord[] public unpackedRecords;
    PackedRecord[] public packedRecords;

    function addUnpacked(uint256 id, uint128 amount, bool active) external {
        unpackedRecords.push(UnpackedRecord({id: id, amount: amount, active: active}));
    }

    function addPacked(uint64 id, uint128 amount, bool active) external {
        packedRecords.push(PackedRecord({id: id, amount: amount, active: active}));
    }
}
