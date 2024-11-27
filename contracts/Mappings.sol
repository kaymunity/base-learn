// SPDX-License-Identifier: NONE

pragma solidity  ^0.8.28;

// contract AdvanceStorage{
//     mapping(address => uint8) ages;

//     function register( address userAddress, uint8 age )external returns(bool){
//         ages[userAddress] = age;
//         return true;
//     }
// }

contract Mappings{
    mapping (address => uint) public favoriteNumbers;
    address[]  favAddress;

    function saveFavoriteNumber(uint _favorite) public {
        favoriteNumbers[msg.sender] = _favorite;
        favAddress.push(msg.sender);
    }

    function returnAllFavs() public view  returns(uint[] memory){
        uint[] memory favNum = new uint[](favAddress.length);

        for (uint i = 0; i < favAddress.length; i++){
            // if (favoriteNumbers[favAddress[i]] == )
            favNum[i] = favoriteNumbers[favAddress[i]];
        }
        return favNum;

    }
}