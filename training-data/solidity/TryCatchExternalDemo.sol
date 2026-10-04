// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Oracle {
    function price(uint256 id) external pure returns (uint256) {
        require(id != 0, "invalid id");
        if (id > 100) {
            revert("unknown asset");
        }
        return id * 1e18;
    }
}

contract TryCatchExternalDemo {
    Oracle public oracle;

    event PriceFetched(uint256 id, uint256 price);
    event PriceFailed(uint256 id, string reason);
    event PriceFailedRaw(uint256 id, bytes data);

    constructor(Oracle _oracle) {
        oracle = _oracle;
    }

    function fetch(uint256 id) external returns (bool ok) {
        try oracle.price(id) returns (uint256 p) {
            emit PriceFetched(id, p);
            return true;
        } catch Error(string memory reason) {
            emit PriceFailed(id, reason);
            return false;
        } catch (bytes memory raw) {
            emit PriceFailedRaw(id, raw);
            return false;
        }
    }

    function fetchOrDefault(uint256 id, uint256 fallbackPrice) external view returns (uint256) {
        try oracle.price(id) returns (uint256 p) {
            return p;
        } catch {
            return fallbackPrice;
        }
    }
}
