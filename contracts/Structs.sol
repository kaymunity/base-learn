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
        mapping(uint => uint)  numberPairs;
    }

    // Favorites faridahFavorites = Favorites(
    //     23,
    //     14,
    //     "Black",
    //     [uint(23),5,8,19,82]
    // );

    Favorites[] public userFavorites;

// Using .push() reference
    function addFavorite(
        uint _favoriteNumber,
        uint _birthDay,
        string calldata _favoriteColor,
        uint[5] calldata _lotteryNumbers
    ) public {
        // .push() returns a reference to the new element
        Favorites storage newFavorite = userFavorites.push();

        newFavorite.favoriteNumber = _favoriteNumber;
        newFavorite.birthDayOfMonth = _birthDay;
        newFavorite.favoriteColor = _favoriteColor;
        newFavorite.luckyLotteryNumbers = _lotteryNumbers;
        newFavorite.numberPairs[33] = 66;
    }


// creating an instance in memory, then push it to storage
    // function addFavorites(
    //     // uint _favoriteNumbers,
    //     // uint _birthDays,
    //     // string calldata _favoriteColor,
    //     // uint[5] calldata _lotteryNumbers
    // ) public {
    //     Favorites memory myFavorites = Favorites(
    //         29,
    //         14,
    //         "red",
    //         [uint(1), 2, 3, 4, 5]
    //     );

    //     userFavorites.push(myFavorites);
    // }
    
    function getArray(uint _index) public view returns(uint[5] memory){ 
        return userFavorites[_index].luckyLotteryNumbers;
    }

}