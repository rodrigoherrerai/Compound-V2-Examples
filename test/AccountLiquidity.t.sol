// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

import "forge-std/Test.sol";

import "./utils/TestUtils.sol";

/// @notice Example contract that calculates the account liquidity.
contract AccountLiquidityTest is Test, TestUtils {
    function setUp() public {
        // Fork mainnet at block 16401180.
        cheat.createSelectFork("mainnet", BLOCK_NUMBER);
    }

    function testAccountLiquidity() public {
        // We supply 1 eth.
        cEther.mint{value: 1 ether}();

        // We enter the markets.
        address[] memory cTokens = new address[](1);
        cTokens[0] = address(cEther);
        comptroller.enterMarkets(cTokens);

        // We get the collateral factor.
        (, uint256 collateralFactorMantissa,) = comptroller.markets(address(cEther));

        // We get the account's liquidity.
        (, uint256 liquidity,) = comptroller.getAccountLiquidity(address(this));
        liquidity = liquidity / 1e18;

        // We get the Eth price from the oracle.
        uint256 price = oracle.getUnderlyingPrice(address(cEther));

        uint256 expectedLiquidity = (price * collateralFactorMantissa / 1e18) / 1e18;

        // Should match.
        assertEq(liquidity, expectedLiquidity);
    }
}
