// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface TimelockInterface {
    function admin() external view returns (address);

    function delay() external view returns (uint256);

    function executeTransaction(address target, uint256 value, string memory signature, bytes memory data, uint256 eta)
        external
        payable
        returns (bytes memory);

    function queueTransaction(address target, uint256 value, string memory signature, bytes memory data, uint256 eta)
        external
        returns (bytes32);
}
