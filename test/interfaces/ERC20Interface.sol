// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface ERC20Interface {
    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function transfer(address dst, uint256 amount) external returns (bool);

    ///// These functions are not from the ERC20 standard.
    ///// They are from the COMP token, we write them here for simplicity.
    function delegate(address delegatee) external;

    function getPriorVotes(address account, uint256 blockNumber) external view returns (uint96);

    /////
}
