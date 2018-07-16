pragma solidity ^0.4.24;


contract FactoryContract {
   address[] carAssets;
   function createChildContract(string brand, string model) public   payable {
      // insert check if the sent ether is enough to cover the car asset ...
      address newCarAsset = new CarAsset(brand, model, msg.sender);            
      carAssets.push(newCarAsset);   
   }
   function getDeployedChildContracts() public view returns (address[]) {
      return carAssets;
   }
}
contract CarAsset {
   string public brand;
   string public model;
   address public owner;
   
   constructor (string _brand, string _model, address _owner) public {
      brand = _brand;
      model = _model;
      owner = _owner;
   }
}
