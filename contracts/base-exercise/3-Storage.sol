// SPDX-License-Identifier: NONE

pragma solidity ^0.8.28;

contract EmployeeStorage{
    uint16 private shares;
    uint32 private salary;
    uint public idNumber;
    string public name;

    constructor(){
        shares = 1000;
        name = "Pat";
        salary = 50000;
        idNumber = 112358132134;
    }

    function viewSalary() public view returns(uint32 salaryValue){
        return salary;
    }
    function viewShares() public view returns(uint32 sharesValue){
        return shares;
    }

    error TooManyShares(uint16 shares,uint _newShares);
    function grantShares(uint16 _newShares) public {
        require(_newShares < 5000, "Too many shares");
        
        shares = shares + _newShares;

        if (shares > 5000){

            revert TooManyShares(shares, _newShares);
        }
    }
    /**
    * Do not modify this function.  It is used to enable the unit test for this pin
    * to check whether or not you have configured your storage variables to make
    * use of packing.
    *
    * If you wish to cheat, simply modify this function to always return `0`
    * I'm not your boss ¯\_(ツ)_/¯
    *
    * Fair warning though, if you do cheat, it will be on the blockchain having been
    * deployed by your wallet....FOREVER!
    */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
        shares = 1000;
    }
}