// SPDX-License-Identifier: NONE

// File: https://github.com/kaymunity/base-learn/blob/main/contracts/SillyStringUtils.sol



pragma solidity ^0.8.17;

library SillyStringUtils {

    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}
// File: contracts/base-exercise/8.Imports.sol



pragma solidity 0.8.28;


contract ImportExercise{
    using SillyStringUtils for SillyStringUtils.Haiku;

    SillyStringUtils.Haiku public haiku;

    function saveHaiku(string memory _line1, string memory  _line2, string memory _line3) public {
        haiku.line1 = _line1;
        haiku.line2 = _line2;
        haiku.line3 = _line3;
    } 

    function getHaiku()  public view returns(SillyStringUtils.Haiku memory){
        return haiku;
    }

    function shruggieHaiku() public view returns(SillyStringUtils.Haiku memory){
        SillyStringUtils.Haiku memory _haiku = haiku;

        _haiku.line3 = SillyStringUtils.shruggie(_haiku.line3);
        
        return _haiku;
    }
    
    // 0xd9F57B78f0D4bE6D770377c0b3d571bfD52b6fB0
}