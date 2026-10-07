// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library IterableMapping {
    struct Map {
        address[] keys;
        mapping(address => uint256) values;
        mapping(address => uint256) indexOf;
        mapping(address => bool) inserted;
    }

    function set(Map storage map, address key, uint256 val) internal {
        if (!map.inserted[key]) {
            map.inserted[key] = true;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key);
        }
        map.values[key] = val;
    }

    function remove(Map storage map, address key) internal {
        if (!map.inserted[key]) return;
        uint256 idx = map.indexOf[key];
        address last = map.keys[map.keys.length - 1];
        map.keys[idx] = last;
        map.indexOf[last] = idx;
        map.keys.pop();
        delete map.inserted[key];
        delete map.values[key];
        delete map.indexOf[key];
    }

    function size(Map storage map) internal view returns (uint256) {
        return map.keys.length;
    }
}

contract IterableMappingDemo {
    using IterableMapping for IterableMapping.Map;
    IterableMapping.Map private balances;

    function set(address a, uint256 v) external { balances.set(a, v); }
    function remove(address a) external { balances.remove(a); }

    function total() external view returns (uint256 sum) {
        for (uint256 i = 0; i < balances.size(); i++) {
            sum += balances.values[balances.keys[i]];
        }
    }
}
