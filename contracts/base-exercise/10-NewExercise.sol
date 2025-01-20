// SPDX-License-Identifier:NONE

pragma solidity 0.8.28;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; 

contract AddressBook is Ownable{
    
   constructor(address initialOwner) Ownable(initialOwner){
    
   }

   struct Contact{

    uint id;
    string firstName;
    string lastName;
    uint[] phoneNumbers;
   }
   
   mapping (uint => Contact) public contacts;
   uint[] contactIds;

   function addContact(
    uint _id,
    string memory _firstName,
    string memory _lastName,
    uint[] memory _phoneNumbers
   ) public onlyOwner() {

    contacts[_id] = Contact({
        id: _id,
        firstName : _firstName,
        lastName : _lastName,
        phoneNumbers: _phoneNumbers
    });

        contactIds.push(_id);
   }

    error ContactNotFound(uint _id);
   function deleteContact( uint _id) external onlyOwner {
    if (contacts[_id].id == 0 ){
        revert ContactNotFound(_id);
    }

    delete contacts[_id];

    for(uint i = 0; i < contactIds.length; i++){
        if (contactIds[i] == _id){
            contactIds[i] = contactIds[contactIds.length - 1];
            contactIds.pop();
            break;
        }
    }
   }

   function getContact(uint _id) public view returns( Contact memory){
       if (contacts[_id].id == 0 ){
        revert ContactNotFound(_id);
        }

    return contacts[_id];
   }

   function getAllContacts() public view returns(Contact[] memory){
    
    Contact[] memory Allcontacts = new Contact[](contactIds.length);
    for(uint i = 0; i < contactIds.length; i++){
     uint index = contactIds[i];

     Allcontacts[i] = contacts[index];
    }

    return Allcontacts;
   }
}

contract AddressBookFactory {
    function deploy() external returns(address){
        AddressBook newContract = new AddressBook(msg.sender);
        return address(newContract);
    }
}
