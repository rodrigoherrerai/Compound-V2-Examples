// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface ComptrollerInterface {
    function enterMarkets(address[] memory cTokens) external returns (uint256[] memory);

    function getAccountLiquidity(address account) external view returns (uint256, uint256, uint256);

    function getAssetsIn(address acount) external view returns (address[] memory);

    function markets(address cToken) external view returns (bool, uint256, bool);
}
