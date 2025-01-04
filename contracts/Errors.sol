// SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract Errors{ 

    function arrayError() public pure returns(uint) { // out of bounds error
        uint[4] memory arr = [uint(1), 2, 3, 4];

        return arr[arr.length];
    } 

    function gasError() public pure returns (uint){  // hits gas limit
        uint seed = 0;

        while (true){
            seed++;
            // Do something
        }

        return seed;
    }

    function overflowUnderflowError() public pure returns (uint){ 
        uint first = 1;
        uint second = 2;

        return first - second;
    }

    function divisionByZeroError() public pure returns(uint) {
        uint first = 1;
        uint second = 0;

        return first / second;
    }

    // Bad code example, do not use
    function compilerTypeError() public pure returns (uint) {
        uint myNumber = 1;
        return myNumber;
    }

    // Bad code example, do not use
    function compilerConversionError() public pure returns (uint) {
        int8 first = 1;

        return uint(uint8(first));
    }

    // Bad code example, do not use
    function compilerOperatorError() public pure returns (uint) {
        int8 first = 1;
        uint256 second = 2;

        uint sum = uint(uint8(first)) + second;

        return sum;
    }
}

contract StackDepth {

    function stackDepthLimit() public pure returns (uint) {

        uint A;

        { uint first = 1;
            uint second = 2;
            uint third = 3;
            uint fourth = 4;
            uint fifth = 5;
            uint sixth = 6;
            uint seventh = 7;
            uint eighth = 8;
        
        A = first +
                second +
                third +
                fourth +
                fifth +
                sixth +
                seventh +
                eighth;
        }

        uint B;
        {
            uint ninth = 9;
            uint tenth = 10;
            uint eleventh = 11;
            uint twelfth = 12;
            uint thirteenth = 13;
            uint fourteenth = 14;
            uint fifteenth = 15;
            uint sixteenth = 16;

            B = ninth +
                tenth +
                eleventh +
                twelfth +
                thirteenth +
                fourteenth +
                fifteenth +
                sixteenth;
        }
        return A + B;
    }
}