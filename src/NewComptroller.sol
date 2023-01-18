// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

contract NewComptroller {
    function acceptImplementation(address comptroller) external {
        bytes4 callData = bytes4(keccak256("_acceptImplementation()"));

        (bool success,) = comptroller.call(abi.encodeWithSelector(callData));
        require(success, "Comptroller: failed to accept implementation");
    }

    function testImplementation() external pure returns (string memory) {
        return "I am the new Comptroller";
    }
}
