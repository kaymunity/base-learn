// SPDX-License-Identifier: NONE

pragma solidity ^0.8.28;

// import "hardhat/console.sol";

contract Controlstructures{
    function fizzBuzz(uint _number) public pure returns(string memory response){
        if (_number % 3 == 0 && _number % 5 == 0){
            return "FizzBuzz";
        }
        else if (_number % 3 == 0){
            return "Fizz";
        }
        else if  (_number % 5 == 0){
            return "Buzz";
        }
        else {
            return "Splat";
        }
    }

    error AfterHours(uint _time);

    function  doNotDisturb(uint _time) public pure returns(string memory feedback){
        
        // reverts to initial state if time is >=2400
        assert(_time < 2400);

        // return error and error value if time is <800 or >2200
        if (_time > 2200 || _time < 800){
            revert AfterHours(_time);
        }

        require(!(_time >= 1200 && _time <= 1259), "At lunch!");


        if (_time >= 800 && _time <= 1199){
            return "Morning!";
        }
        else if(_time >= 1300 && _time <= 1799){
            return "Afternoon!";
        }
        else if(_time >= 1800 && _time <= 2200){
            return "Evening!";
        }
    }

}