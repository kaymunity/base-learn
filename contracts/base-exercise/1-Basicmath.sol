// SPDX-License-Identifier: NONE

pragma solidity ^0.8.28;

contract BasicMath{
    function adder(uint _a, uint _b) public pure returns (uint, bool) {
        // Use Solidity's checked arithmetic with the built-in addition function
        unchecked {
            uint sum = _a + _b;
            // Check if overflow occurred by comparing sum with _a
            if (sum < _a) {
                // Overflow occurred, return 0 and error = true
                return (0, true);
            } else {
                // No overflow, return the sum and error = false
                return (sum, false);
            }
        }
    }

    function subtractor(uint _c, uint _d) public pure returns (uint, bool){
        unchecked {
            uint sub = _c - _d;
            if (sub > _c){
                return (0, true);
            } else return (sub, false); 
        }
    }
}