// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // state variables = 
    uint public my_uint = 1; // stored on the blockchain, can be accessed in the entire smart contract

    // local variables = exist inside a function
    function getValue() public pure returns(uint) {
        uint value = 1; // local variable, readable/writable only here
        return value;
    }

    // different size to control energy used on the blockchain
    uint256 public my_uint256 = 1; // also negative (-1)
    uint8 public my_uint8 = 1;

    string public my_string = "Hello, World!";
    bytes32 public my_bytes32 = "Hello, Wordl!";

    // user account on blockchain
    // every contract have an address
    address public my_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // structures 
    struct myStruct {
        uint256 my_uint256_1;
        string my_string_1;
    }
    
    // setting a variable based on the structure 
    myStruct public my_struct = myStruct(1, "Hello, World!");
}