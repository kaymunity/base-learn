// SPDX-License-Identifier: NONE

pragma solidity  ^0.8.28;

contract Compliment{
    string public name;

    constructor(string memory _name) {
        name = _name;
    }   

    function complimentUser() public view returns(string memory){
        return string.concat("Nice hat ", name);
    }
}

contract ComplimenterFactory{
    function CreateComplimenter(string memory _name) public  returns(address){
        Compliment newCompliment = new Compliment(_name);

        return address(newCompliment);  
    }
}