// SPDX-License-Identifier: NONE

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
    // function printAllElmentsinArray() public{
    //     for (uint i = 0, i < )
    // }
}