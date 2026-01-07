// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseRoyaltyPayment {
    address public owner;
    uint256 public royaltyPercentage;  // in basis points (100 = 1%)
    mapping(address => uint256) public creatorRoyalties;

    event RoyaltyPaid(address indexed creator, uint256 amount);
    event RoyaltyPercentageUpdated(uint256 newPercentage);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(uint256 _royaltyPercentage) {
        owner = msg.sender;
        royaltyPercentage = _royaltyPercentage;
    }

    function setRoyaltyPercentage(uint256 newPercentage) external onlyOwner {
        require(newPercentage <= 10000, "Percentage cannot exceed 100%");
        royaltyPercentage = newPercentage;
        emit RoyaltyPercentageUpdated(newPercentage);
    }

    function registerCreator(address creator) external onlyOwner {
        creatorRoyalties[creator] = 0;
    }

    function payRoyalty(address creator, uint256 salePrice) external {
        require(creatorRoyalties[creator] >= 0, "Creator not registered");

        uint256 royaltyAmount = (salePrice * royaltyPercentage) / 10000;
        payable(creator).transfer(royaltyAmount);
        creatorRoyalties[creator] += royaltyAmount;

        emit RoyaltyPaid(creator, royaltyAmount);
    }

    function getCreatorRoyalty(address creator) external view returns (uint256) {
        return creatorRoyalties[creator];
    }
}
