// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library AddressSetLib {
    struct Set {
        address[] values;
        mapping(address => uint256) indexPlusOne; // 0 means absent
    }

    function add(Set storage s, address a) internal returns (bool) {
        if (s.indexPlusOne[a] != 0) return false;
        s.values.push(a);
        s.indexPlusOne[a] = s.values.length;
        return true;
    }

    function remove(Set storage s, address a) internal returns (bool) {
        uint256 idx = s.indexPlusOne[a];
        if (idx == 0) return false;
        uint256 last = s.values.length;
        if (idx != last) {
            address moved = s.values[last - 1];
            s.values[idx - 1] = moved;
            s.indexPlusOne[moved] = idx;
        }
        s.values.pop();
        delete s.indexPlusOne[a];
        return true;
    }

    function contains(Set storage s, address a) internal view returns (bool) {
        return s.indexPlusOne[a] != 0;
    }

    function length(Set storage s) internal view returns (uint256) {
        return s.values.length;
    }
}

contract MembersDemo {
    using AddressSetLib for AddressSetLib.Set;

    AddressSetLib.Set private members;

    function join() external returns (bool) {
        return members.add(msg.sender);
    }

    function leave() external returns (bool) {
        return members.remove(msg.sender);
    }

    function isMember(address a) external view returns (bool) {
        return members.contains(a);
    }

    function count() external view returns (uint256) {
        return members.length();
    }

    function list() external view returns (address[] memory) {
        return members.values;
    }
}
