//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

import "hardhat/console.sol";

contract ControlStructures{ 
    error InvalidNumber(uint _Number1, uint _Number2);

    function CompareNumbers(uint  _Number1, uint _Number2) external pure returns(string memory answer){
        // require (_Number1 > 0 && _Number2 > 0, "Invalid input");
        
        if (_Number1 == 0 || _Number2 == 0){
            revert InvalidNumber(_Number1, _Number2);
        }

        if (_Number1 < _Number2)   {
            return "Number1 is less than Number2";
        }
        else if(_Number1 > _Number2){
            return "Number 1 is greater than Number2";
        }
        else return "Number1 equals Number2";
    }

    function loops() external pure {
        for (uint i = 0; i < 8; i++){
            console.log("This index is", i);

            if (i == 2){
                console.log("*This is 2");
                console.log("^Next Cycle");
                continue;
            }

            if (i == 4){
                console.log("*This is 4");
                // console.log("End  of loop");
                break;
            }
            console.log("Next Cycle"); 
        }
    }

    // function demo(uint _a) public pure returns(uint){
    //     for (uint count = 0 ; count < _a ; count++){
    //         console.log(count);
    //         if (count == 5){
    //             return 1;
    //         }
    //     }
    // }

}

