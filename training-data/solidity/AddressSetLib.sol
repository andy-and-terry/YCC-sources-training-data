// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Set of addresses with O(1) add, remove and contains.
library AddressSetLib {
    struct Set {
        address[] items;
        mapping(address => uint256) index; // 1-based; 0 means absent
    }

    function add(Set storage s, address a) internal returns (bool) {
        if (s.index[a] != 0) return false;
        s.items.push(a);
        s.index[a] = s.items.length;
        return true;
    }

    function remove(Set storage s, address a) internal returns (bool) {
        uint256 idx = s.index[a];
        if (idx == 0) return false;
        address last = s.items[s.items.length - 1];
        s.items[idx - 1] = last;
        s.index[last] = idx;
        s.items.pop();
        delete s.index[a];
        return true;
    }

    function contains(Set storage s, address a) internal view returns (bool) {
        return s.index[a] != 0;
    }

    function length(Set storage s) internal view returns (uint256) {
        return s.items.length;
    }
}

contract AddressSetDemo {
    using AddressSetLib for AddressSetLib.Set;
    AddressSetLib.Set private members;

    function join() external returns (bool) { return members.add(msg.sender); }
    function leave() external returns (bool) { return members.remove(msg.sender); }
    function isMember(address a) external view returns (bool) { return members.contains(a); }
    function size() external view returns (uint256) { return members.length(); }
}
