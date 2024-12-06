//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract Foo {
    constructor() {
        // Bad code example, will not work
        uint bar = foo(3);
        // ... other code
    }

// external function
    function foo(uint _number) external pure returns (uint) {
         return _number*2;
    }

// public function
    function foo(uint _number) public pure returns (uint) {
        return _number*2;
    }

// private function
    function _foo(uint _number) private returns (uint) {
        return _number*2;
    }
}
