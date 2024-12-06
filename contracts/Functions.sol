//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract Foo {
    address public owner;

    constructor() {
        // Bad code example, will not work
        uint bar = foo2(3);
        // ... other code

        owner = msg.sender;
    }

// external function
    function foo(uint _number) external view onlyOwner returns (uint) {
         return _number*2;
    }

// public function
    function foo2(uint _number) public view onlyOwner returns (uint) {
        return _number*2;
    }

// private function
    function _foo(uint _number) private pure returns (uint) {
        return _number*2;
    }


    /*

    FUNCTION MODIFIERS 
    */
    modifier  onlyOwner{
        require(msg.sender == owner, "Invalid owner");
        _;
    }
}