//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;


// contract SimpleContractB{
//     function whoAmI() public pure returns(string memory){
//     return "SimpleContractB";
//     }

//     function whoAmIInternal() internal pure returns(string memory){
//     return "SimpleContractB";
// }
// }

// contract SimpleContractA is SimpleContractB{
//     function whoAmIEnternal() external pure returns(string memory){
//         return whoAmIInternal();
//     }
// }

// contract C is SimpleContractB, SimpleContractA{

// }

contract C{

}

contract B is C{

}

contract A is C,B{

}






// contract ContractA{
//     function whoAmI() public pure returns(string memory){
//         return "This is Contract A";
//     }

//     function foo() internal  pure returns(string memory){
//         return "Yes!!";
//     }
// }

// contract ContractB is ContractA { // Inherits from ContractA

//     // calls internal function foo from ContractA
//     function foo2() public pure returns(string memory){
//         return foo();
//     }
// }