// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

import "forge-std/Test.sol";

import "./utils/TestUtils.sol";

/// @notice Example contract that supplies an asset to Compound and redeems it.
contract SupplyAndRedeemTest is Test, TestUtils {
    receive() external payable {}

    function setUp() public {
        // Fork mainnet at block 16401180.
        cheat.createSelectFork("mainnet", BLOCK_NUMBER);
    }

    /// @dev Calculates the exchange rate between eth and cEther.
    function getExchangeRate() internal returns (uint256) {
        // exchangeRate = (totalCash + totalBorrows - totalReserves) / totalSupply.
        uint256 totalCash = cEther.getCash();
        assertEq(totalCash, address(cEther).balance);

        uint256 totalBorrows = cEther.totalBorrowsCurrent();
        assert(totalBorrows > 0);

        uint256 totalReserves = cEther.totalReserves();
        assert(totalReserves > 0);

        uint256 totalSupply = cEther.totalSupply();
        assert(totalSupply > 0);

        uint256 exchangeRate = 1e18 * (totalCash + totalBorrows - totalReserves) / totalSupply;
        return exchangeRate;
    }

    /// @notice Supplies Eth to Compound, checks balances, accrues interests, and redeems.
    function testSupplyAndRedeem() public {
        // We save the initial eth balance to compare it later on.
        uint256 initialEthBalance = address(this).balance;

        // Our initial cEther balance should be 0.
        assertEq(cEther.balanceOf(address(this)), 0);

        // We supply 1 ether.
        cEther.mint{value: 1 ether}();

        // We could get the exchange rate by calling "exchangeRateCurrent()" directly.
        // We calculate it ourselves for learning purposes.
        uint256 exchangeRate = getExchangeRate();

        // We get the balance of cEther after supplying.
        uint256 cEtherBalance = cEther.balanceOf(address(this));

        // We get the amount of cEther that we should have.
        uint256 mintTokens = 1 ether * 1e18 / exchangeRate;
        assertEq(cEtherBalance, mintTokens);

        // We incrase the block number by 1.
        vm.roll(block.number + 1);

        // We redeem all the cEther.
        require(cEther.redeem(cEther.balanceOf(address(this))) == 0, "redeem failed");

        // We should have 0 cEther.
        assertEq(cEther.balanceOf(address(this)), 0);

        // Eth + interests. We should have more eth with 1 block of interests.
        assert(address(this).balance > initialEthBalance);
    }
}
