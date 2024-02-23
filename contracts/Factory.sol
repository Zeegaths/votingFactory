// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import './Voting.sol';

contract VotingFactory {
    
    Voting[] votingClones;

    function createVotingClone(string  memory _pollName) external returns(Voting newVoting_, uint256 length_) {
        newVoting_ = new Voting(_pollName);

        votingClones.push(newVoting_);

        length_ = votingClones.length;

    }

    function getVotingClones() external view returns(Voting[] memory) {
        return votingClones;
    }
}