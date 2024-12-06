//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract Structs {
    // struct User{
    //     uint8 age;
    //     string name;
    // }

    // User public user;

    // function getUserInfo(uint8 _age, string memory _name) public returns(User memory) {
    //     user = User(_age, _name);
    //     return user;
    // }



    /*
    Struct Practice
    */

    struct Favorites{
        uint birthDayOfMonth;
        uint favoriteNumber;
        string favoriteColor;
        uint[5] luckyLotteryNumbers;
    }

    Favorites faridahFavorites = Favorites(
        23,
        14,
        "Black",
        [uint(23),5,8,19,82]
    );

    
}