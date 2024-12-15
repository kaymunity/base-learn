//SPDX-License-Identifier: NONE

pragma solidity 0.8.28;

contract ContractC{
    function whoAmI() public virtual view returns(string memory){
        return "ContractC";
    }
}

contract ContractB{
    function whoAmI() public virtual view returns(string memory){
    return "ContractB";
    }

    function whoAmIInternal() internal pure returns(string memory){
    return "ContractB";
}
}

contract ContractA is ContractB, ContractC{
    enum Type {
        None,
        ContractBType,
        ContractCType
    }

    Type contractType;

    constructor(Type _initialType){
        contractType = _initialType;
    }

    function whoAmI() public override(ContractB, ContractC) view returns(string memory){
        if (contractType == Type.ContractBType) {
            return ContractB.whoAmI();
        }

        if (contractType == Type.ContractCType) {
            return ContractC.whoAmI();
        }
        return "contract A";
    }

    function switchCurrentType(Type _switchType) public{
        contractType = _switchType;
    }
    

    function whoAmIEnternal() external  pure returns(string memory){
        return whoAmIInternal();
    }
}



// contract B is C{

// }

// contract A is C,B{

// }






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