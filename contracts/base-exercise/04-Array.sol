// SPDX-License-Identifier:NONE

pragma solidity ^0.8.28;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    uint[]  public timestamps;
    address[] public senders;

// returns all elements in numbers array
    function getNumbers() public view returns(uint[] memory){
        return numbers;
    }

// reset numbers to initial state 1-10
    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }
    function appendToNumbers(uint[] calldata _toappend) external {
        for (uint i = 0; i < _toappend.length; i++){
            numbers.push(_toappend[i]);
        }
    } 

    function saveTimestamp(uint _unixTimestamp) external{
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }
    
    function afterY2K() public view returns(uint[] memory , address[] memory){
        uint greaterY2K;
        for (uint a = 0; a < timestamps.length; a++){
            if (timestamps[a] > 946702800){
                greaterY2K++;
            }
        }

        uint[] memory unixTimestamp = new uint[](greaterY2K);
        address[] memory sender = new address[](greaterY2K);
        uint count;

        for (uint i = 0; i < timestamps.length; i++){
            if (timestamps[i] > 946702800){
// ///////////////////////////////////////////////////////
                unixTimestamp[count] = timestamps[i];
                sender[count] = senders[i];
//////////////////////////////////////////////////////////
                count++;
            }
        }

        return (unixTimestamp, sender);
    }
    function resetSenders() public{
        delete senders;
    }
    function resetTimestamps() public{
        delete timestamps;
    }
}