// SPDX-License-Identifier:MIT

pragma solidity  ^0.8.27; 

contract Greeting {
    function sayHello() pure external returns (string memory) {
          return "hello world";
    }
}