// SPDX-License-Identifier:NONE

pragma solidity ^0.8.28;

contract FavoriteRecords {
    // State variables
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) private userFavorites;

    // Custom error
    error NotApproved(string albumName);

    // Approved album names
    string[] private approvedAlbumList = [
        "Thriller",
        "Back in Black",
        "The Bodyguard",
        "The Dark Side of the Moon",
        "Their Greatest Hits (1971-1975)",
        "Hotel California",
        "Come On Over",
        "Rumours",
        "Saturday Night Fever"
    ];

    // Constructor to load approved albums
    constructor() {
        for (uint i = 0; i < approvedAlbumList.length; i++) {
            approvedRecords[approvedAlbumList[i]] = true;
        }
    }

    // Function to get approved records
    function getApprovedRecords() public view returns (string[] memory) {
        return approvedAlbumList;
    }

    // Function to add a record to the user's favorites
    function addRecord(string memory albumName) public {
        if (!approvedRecords[albumName]) {
            revert NotApproved(albumName);
        }
        userFavorites[msg.sender][albumName] = true;
    }

    // Function to get a user's favorite records
    function getUserFavorites(address user) public view returns (string[] memory)
    {
        uint count = 0;
        for (uint i = 0; i < approvedAlbumList.length; i++) {
            if (userFavorites[user][approvedAlbumList[i]]) {
                count++;
            }
        }

        string[] memory favorites = new string[](count);
        uint index = 0;
        for (uint i = 0; i < approvedAlbumList.length; i++) {
            if (userFavorites[user][approvedAlbumList[i]]) {
                favorites[index] = approvedAlbumList[i];
                index++;
            }
        }

        return favorites;
    }

    // Function to reset a user's favorites
    function resetUserFavorites() public {
        for (uint i = 0; i < approvedAlbumList.length; i++) {
            userFavorites[msg.sender][approvedAlbumList[i]] = false;
        }
    }
}
