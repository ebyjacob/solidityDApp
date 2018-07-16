pragma solidity ^0.4.24;


contract SelfDesctructionContract {
   
    address public owner;
    string public someValue ;
   
   modifier ownerRestricted {
      require(owner == msg.sender);
      _;
   } 
   // constructor
   constructor() public{
      owner = msg.sender;
   }
   // a simple setter function
   function setSomeValue(string value) public{
      someValue = value;
   } 
   // you can call it anything you want
   function destroyContract() ownerRestricted public {
     selfdestruct(owner);
   }
}
