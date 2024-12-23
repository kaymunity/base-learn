// SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/structs/EnumerableSet.sol";

contract SetExploration{
    using EnumerableSet for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet private visitors;

    function registerVisitor() public {
        visitors.add(msg.sender);
    }

    function numberOfVisitors() public view returns(uint){
        return visitors.length();
    }
}