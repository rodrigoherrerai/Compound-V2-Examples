// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface OracleInterface {
    function getUnderlyingPrice(address cToken) external view returns (uint256);
}
