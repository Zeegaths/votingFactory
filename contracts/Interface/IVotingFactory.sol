// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import '../Voting.sol';

interface IVotingFactory {
    event VotingCloneCreated(address indexed creator, Voting indexed newVoting);

    function createVotingClone(string memory _pollName) external returns (Voting newVoting);
    
    function getVotingCloneCount() external view returns (uint256);

    function getVotingClones() external view returns (Voting[] memory);
}