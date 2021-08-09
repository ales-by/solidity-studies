//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SharedWallet is Ownable{
    mapping (address => uint) allowance;
    
    function isAllowed(address _to, uint _amount) private view returns(bool) {
        return msg.sender == owner() || allowance[_to] >= _amount || _amount <= address(this).balance;
        
    }
    
    
    function sendTo(address payable _to, uint _amount) public{
        require(isAllowed(_to, _amount));
        _to.transfer(_amount);
    }
    
    function allowUser(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }
    
    function restrictUser(address _who) public onlyOwner {
        allowance[_who] = 0;
    }
    
    receive() external payable {}
}
