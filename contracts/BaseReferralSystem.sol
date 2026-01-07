// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseReferralSystem {
    address public owner;
    mapping(address => address) public referrals;
    mapping(address => uint256) public rewards;

    event ReferrerRegistered(address indexed referrer, address indexed referee);
    event RewardClaimed(address indexed user, uint256 reward);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerReferral(address referrer) external {
        require(referrals[msg.sender] == address(0), "Referral already registered");
        require(referrer != msg.sender, "Cannot refer yourself");

        referrals[msg.sender] = referrer;
        rewards[referrer] += 1;

        emit ReferrerRegistered(referrer, msg.sender);
    }

    function claimReward() external {
        uint256 reward = rewards[msg.sender];
        require(reward > 0, "No rewards available");

        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(reward * 0.1 ether);

        emit RewardClaimed(msg.sender, reward * 0.1 ether);
    }

    function getReferral(address user) external view returns (address) {
        return referrals[user];
    }

    function getReward(address user) external view returns (uint256) {
        return rewards[user];
    }
}
