//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract Modify{
    // uint public price;
    // address public owner;

    // constructor() {
    //     owner = msg.sender;
    // }

    // error NotOwner(address notOwnerAdress);

    // modifier onlyOwner {
    //     if (msg.sender != owner){

    //     revert NotOwner(msg.sender);

    //     }
    //     _;
    // }

    // function addPrice(uint _addedPrice) public onlyOwner returns(uint) {
    //     price = _addedPrice;
    //     return price;
    // }

    // error NotEven(uint number);

    // modifier onlyEven(uint _number) {
    //     if(_number % 2 != 0) {
    //         revert NotEven(_number);
    //     }
    //     _;
    // }

    // function halver(uint _number) public pure onlyEven(_number) returns (uint) {
    //     return _number / 2;
    // }
    uint public number;
    // Bad code example, does not work
    modifier doubler(uint _number) {
        number = _number *= 2;
        _;
    }

    function modifierDoubler(uint _number) public doubler(_number) returns (uint) {
        return number; 
    }
}