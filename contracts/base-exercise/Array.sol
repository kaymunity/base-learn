// SPDX-License-Identifier:NONE

pragma solidity ^0.8.28;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    uint[]  public timestamps;
    address[] public senders;

// returns all elements in numbers array
    function getNumbers() public view returns(uint[] memory){
        return numbers;
    }

// reset numbers to initial state 1-10
    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }
    function appendToNumbers(uint[] calldata _toappend) external {
        for (uint i = 0; i < _toappend.length; i++){
            numbers.push(_toappend[i]);
        }
    } 
}