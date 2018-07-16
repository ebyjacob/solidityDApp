pragma solidity ^0.4.24;


contract Adoption {

    address[16] public adopters;
    
     mapping(address => bool) adoptedUsers;
    //address owner;

/*    struct Pet {
        address owner;
        uint256 price;
    }

    Pet[16] pets;

    */
    // Adopting a pet
    function adopt(uint petId) public returns (uint) { //uint price

        //revert; throw;
        
        require(petId >= 0 && petId <= 15);

        //require(!adoptedUsers[msg.sender]);

        //require(msg.value >= pets[petId].price;
        adopters[petId] = msg.sender;
        adoptedUsers[msg.sender] = true;
        //pets[petId].price = pets[petId].price;
        //emit AdoptedE (msg.sender, petId);
        //pets[petId].owner.send(price);
        return petId;
    }


  // Retrieving the adopters
    function getAdopters() public view returns (address[16]) {
        return adopters;
    }

}



