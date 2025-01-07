// SPDX-License-Identifier:NONE

pragma solidity 0.8.28;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; 

contract AdressBook is Ownable{
    using
   constructor(address initialOwner) Ownable(initialOwner){  }

   struct Contact{

    uint id;
    string firstName;
    string lastName;
    uint[] phoneNumbers;
   }
   
   mapping(uint => Contact) public contacts;

   function addContact(
    uint _id,
    string memory _firstName,
    string memory _lastName,
    uint[] memory _phoneNumbers
   ) public {
    _checkOwner();

    contacts[_id] = Contact({
        id: _id,
        firstName : _firstName,
        lastName : _lastName,
        phoneNumbers: _phoneNumbers
    });
   }

    error ContactNotFound(uint _id);
   function deleteContact( uint _id) external {
    
    if (msg.sender == initialOwner){
        delete contacts[_id];
    }
    else{
        revert ContactNotFound(_id);
    }
   }


}