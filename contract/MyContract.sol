// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // state variables = 
    uint myUint = 1; // stored on the blockchain, can be accessed in the entire smart contract

    // local variables = exist inside a function
    function getValue() public pure returns(uint) {
        uint value = 1; // local variable, readable/writable only here
        return value;
    }


    
}