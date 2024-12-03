// SPDX-License-Identifier:NONE

pragma solidity ^0.8.28;

contract FavoriteRecords{
    mapping (uint => string[]) public approvedRecords;

    mapping (address => string) public userFavorites ;

    string[]  dummy;
    function loadingApprovedRecords(string memory _album) public returns(bool){

        approvedRecords[0] = ["Thriller"];
        // approvedRecords[1] = "Back in Black";
        // approvedRecords[2] = "The Bodyguard";
        // approvedRecords[3] = "The Dark Side of the Moon";
        // approvedRecords[4] = "Their Greatest Hits (1971-1975)";
        // approvedRecords[5] = "Hotel California";
        // approvedRecords[6] = "Come On Over";
        // approvedRecords[7] = "Rumours";
        // approvedRecords[8] = "Saturday Night Fever";

        bool found = false;
        for (uint i = 0; i < 9; i++){
            if(keccak256(abi.encodePacked(approvedRecords[i])) == keccak256(abi.encodePacked(_album))){
                found = true;
                break;
            }
        }
        return found;
    }

    function favoriteAlbum(string memory _favAlbum) public returns(bool){
        userFavorites[msg.sender] = _favAlbum;

        bool foundFav = false;
        if (keccak256(abi.encodePacked(userFavorites[msg.sender])) == keccak256(abi.encodePacked(_favAlbum))){
            foundFav = true;
        }
        return foundFav;
    }

    function getApprovedRecords() public view returns(string[] memory){
        string[] memory tempRecord = new string[](9);
        for (uint i = 0; i < 9;i++){
            tempRecord[i] = approvedRecords[i];
        }
        return tempRecord;
    }
}