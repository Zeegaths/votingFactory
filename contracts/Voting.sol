// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Voting {

    uint public totalVotes;
    string public electionName;
    address public owner;

    struct Candidate {
        uint ID;
        string Name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) hasVoted;

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier hasNotVoted() {
        require(!hasVoted[msg.sender], "User already voted");
        _;
    }

    constructor(string memory _pollName) {
        electionName = _pollName;
        owner = msg.sender;
    }

    function addCandidate(string memory _name) external onlyOwner {
        uint candidateID = candidates.length + 1;

        Candidate memory newCandidate = Candidate({
            ID: candidateID,
            Name: _name,
            voteCount: 0
        });

        candidates.push(newCandidate);
    }

    function vote(uint _candidateID) public hasNotVoted {
        require(_candidateID > 0 && _candidateID <= candidates.length, "Invalid candidate ID");


        Candidate storage chosenCandidate = candidates[_candidateID - 1];
        chosenCandidate.voteCount += 1;

        hasVoted[msg.sender] = true;
        totalVotes += 1;
    }

    function getCandidateCount() external view returns (uint) {
        return candidates.length;
    }

    function getCandidate(uint _candidateID) external view returns (uint, string memory, uint) {
        require(_candidateID > 0, "Invalid candidate ID");
        require(_candidateID <= candidates.length, "Invalid candidate ID");
    

        Candidate storage chosenCandidate = candidates[_candidateID - 1];
        return (chosenCandidate.ID, chosenCandidate.Name, chosenCandidate.voteCount);
    }
}

