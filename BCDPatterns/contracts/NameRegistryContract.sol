pragma solidity ^0.4.24;

contract NameRegistry {
   struct ContractDetails {
      address owner;
      address contractAddress;
      uint16 version;
   }
   mapping(string => ContractDetails) registry;
   
   function registerName(string name, address addr, uint16 ver) public returns (bool) {
      // versions should start from 1
      require(ver >= 1);
      
      ContractDetails memory info = registry[name];
      require(info.owner == msg.sender);
      // create info if it doesn't exist in the registry
       if (info.contractAddress == address(0)) {
          info = ContractDetails({
             owner: msg.sender,
             contractAddress: addr,
             version: ver
          });
       } else {
          info.version = ver;
          info.contractAddress = addr;
       }
       // update record in the registry
       registry[name] = info;
       return true;
   }
    function getContractDetails(string name) constant public returns(address, uint16) {
      return (registry[name].contractAddress, registry[name].version);
   }
}
