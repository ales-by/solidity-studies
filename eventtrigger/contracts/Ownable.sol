pragma solidity ^0.8.4;
// SPDX-License-Identifier: MIT

contract Ownable {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(isOwner(), "You are not the owner!");
        _;
    }
    
    function isOwner() public view returns(bool) {
        return (owner == msg.sender);
    }
}
