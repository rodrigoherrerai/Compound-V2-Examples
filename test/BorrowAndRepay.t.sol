// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

import "forge-std/Test.sol";

import "./utils/TestUtils.sol";

/// @notice Example contract that borrows and repays from Compound.
contract BorrowAndRepayTest is Test, TestUtils {
    function setUp() public {
        // Fork mainnet at block 16401180.
        cheat.createSelectFork("mainnet", BLOCK_NUMBER);
    }

    /// @notice Supplies Eth to Compound, checks balances, accrues interest, and redeems.
    function testBorrowAndRepay() public {
        // We shouldn't have any Dai balance at this time.
        assertEq(dai.balanceOf(address(this)), 0);

        ///// We need to supply some eth for collateral.
        cEther.mint{value: 1 ether}();

        // We enter the markets.
        address[] memory cTokens = new address[](1);
        cTokens[0] = address(cEther);
        comptroller.enterMarkets(cTokens); // <- we enter here

        // Checks
        address[] memory assetsIn = comptroller.getAssetsIn(address(this));
        assertEq(assetsIn[0], address(cEther));

        /////

        ///// Now we borrow some dai.
        uint256 borrowAmount = 500 * 1e18; // 500 dai
        cDai.borrow(borrowAmount);

        // Checks .. We should have 500 dai
        assertEq(dai.balanceOf(address(this)), borrowAmount);

        /////

        ///// We repay the dai.
        dai.approve(address(cDai), borrowAmount);
        cDai.repayBorrow(borrowAmount);

        assertEq(dai.balanceOf(address(this)), 0);
    }
}
