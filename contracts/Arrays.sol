// SPDX-License-Identifier: NONE

import "hardhat/console.sol";

pragma solidity ^0.8.28;

contract Array{
    uint[] public dynamicArray; //dynamically stored array, stored in storage

    uint[10] public fixedArray; //fixed stored array, stored in storage

// dealing with dynamic array
    function addNewElementToDynamicArray(uint _element) external {
        dynamicArray.push(_element);
    }

    function removeLastElement() external{
        dynamicArray.pop();
    }

    function printAllElmentsinArray() public view{

        for (uint i = 0; i < dynamicArray.length; i++ ){
            console.log(dynamicArray[i]);
        }
    }

// dealing with fixed array
    function addElementToFixedArray(uint _index, uint _newElement) public{
        fixedArray[_index] = _newElement;

    }
    function printFixedArray() public view returns(uint[2] memory){
        uint[2] memory result;
        
        // for (uint i = 0; i < fixedArray.length; i++ ){
        //     console.log(fixedArray[i]);
        // }

        for (uint i = 0; i < 2; i++ ){
            result[i] = fixedArray[i];
        }
        return result;
    }

// Array Storage Layout

}