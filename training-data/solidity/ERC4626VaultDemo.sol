// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal interface for the underlying asset token.
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

// Simplified ERC-4626-style tokenized vault: deposit an underlying
// asset and receive shares proportional to the vault's holdings;
// redeem shares later for the underlying asset, including any yield
// the vault accrued in the meantime.
contract ERC4626VaultDemo {
    IERC20 public immutable asset;
    uint256 public totalShares;
    mapping(address => uint256) public sharesOf;

    constructor(address _asset) {
        asset = IERC20(_asset);
    }

    function totalAssets() public view returns (uint256) {
        return asset.balanceOf(address(this));
    }

    function convertToShares(uint256 assets) public view returns (uint256) {
        if (totalShares == 0) return assets;
        return (assets * totalShares) / totalAssets();
    }

    function convertToAssets(uint256 shares) public view returns (uint256) {
        if (totalShares == 0) return shares;
        return (shares * totalAssets()) / totalShares;
    }

    function deposit(uint256 assets) external returns (uint256 shares) {
        require(assets > 0, "zero deposit");
        shares = convertToShares(assets);
        require(asset.transferFrom(msg.sender, address(this), assets), "transfer failed");
        totalShares += shares;
        sharesOf[msg.sender] += shares;
    }

    function redeem(uint256 shares) external returns (uint256 assets) {
        require(shares > 0 && shares <= sharesOf[msg.sender], "invalid shares");
        assets = convertToAssets(shares);
        sharesOf[msg.sender] -= shares;
        totalShares -= shares;
        require(asset.transfer(msg.sender, assets), "transfer failed");
    }
}
