// SPDX-License-Identifier: NONE

pragma solidity ^0.8.28;

contract SimpleStorage{
    uint8 public age;
    uint8 public cars_owned;

    constructor( uint8 _age, uint8 _cars) {
        cars_owned = _cars; 
        age = _age;
    }

    function orderOfCars(uint8 _numberOfCars) public {
        cars_owned = _numberOfCars;
    }
    function incrementAge() public{
        age++;
    }
    function adminSetAge(uint8 _setAge) public {
        age = _setAge;
    }
}