// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import '../Voting.sol';

interface IVoting {
    function totalVotes() external view returns (uint);
    function electionName() external view returns (string memory);
    function owner() external view returns (address);

    function addCandidate(string memory _name) external;
    function vote(uint _candidateID) external;
    function getCandidateCount() external view returns (uint);
    function getCandidate(uint _candidateID) external view returns (uint, string memory, uint);
}