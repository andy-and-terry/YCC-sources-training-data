// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A fixed-capacity LRU cache approximated on-chain: a "last used"
// counter is stamped on every access, and eviction scans for the
// stalest entry. Not gas-cheap at scale, but illustrates the idea
// without off-chain indexing.
contract LRUCacheDemo {
    struct Entry {
        bool exists;
        uint256 value;
        uint256 lastUsed;
    }

    uint256 public immutable capacity;
    uint256 public size;
    uint256 private clock;
    mapping(uint256 => Entry) private cache;
    uint256[] private keys;

    constructor(uint256 _capacity) {
        capacity = _capacity;
    }

    function get(uint256 key) external returns (uint256 value, bool found) {
        Entry storage e = cache[key];
        if (!e.exists) return (0, false);
        clock++;
        e.lastUsed = clock;
        return (e.value, true);
    }

    function put(uint256 key, uint256 value) external {
        clock++;
        if (cache[key].exists) {
            cache[key].value = value;
            cache[key].lastUsed = clock;
            return;
        }

        if (size == capacity) {
            _evictOldest();
        }

        cache[key] = Entry({exists: true, value: value, lastUsed: clock});
        keys.push(key);
        size++;
    }

    function _evictOldest() private {
        uint256 oldestIdx = 0;
        uint256 oldestTime = type(uint256).max;
        for (uint256 i = 0; i < keys.length; i++) {
            Entry storage e = cache[keys[i]];
            if (e.exists && e.lastUsed < oldestTime) {
                oldestTime = e.lastUsed;
                oldestIdx = i;
            }
        }
        delete cache[keys[oldestIdx]];
        keys[oldestIdx] = keys[keys.length - 1];
        keys.pop();
        size--;
    }
}
