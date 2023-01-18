// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface CTokenInterface {
    function balanceOf(address owner) external view returns (uint256);

    function balanceOfUnderlying(address owner) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function borrowBalanceCurrent(address account) external returns (uint256);

    function decimals() external view returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function getCash() external view returns (uint256);

    function mint(uint256 amount) external returns (uint256);

    function mint() external payable; // cEther.

    function repayBorrow(uint256 amount) external;

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function supplyRatePerBlock() external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    function totalBorrowsCurrent() external returns (uint256);

    function totalReserves() external view returns (uint256);

    function totalSupply() external view returns (uint256);
}
