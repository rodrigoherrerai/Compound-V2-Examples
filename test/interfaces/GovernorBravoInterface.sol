// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0;

interface GovernorBravoInterface {
    enum ProposalState {
        Pending,
        Active,
        Canceled,
        Defeated,
        Succeeded,
        Queued,
        Expired,
        Executed
    }

    function castVote(uint256 proposalId, uint8 support) external;

    function execute(uint256 proposalId) external payable;

    function proposalCount() external view returns (uint256);

    function propose(
        address[] memory targets,
        uint256[] memory values,
        string[] memory signatures,
        bytes[] memory calldatas,
        string memory description
    ) external returns (uint256);

    function queue(uint256 proposalId) external;

    function state(uint256 proposalId) external view returns (uint256);

    function getActions(uint256 proposalId)
        external
        view
        returns (
            address[] memory targets,
            uint256[] memory values,
            string[] memory signatures,
            bytes[] memory calldatas
        );

    function votingDelay() external view returns (uint256);

    function votingPeriod() external view returns (uint256);
}
