// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // create a variable
    // setting it public will create a funcion like the previous getCount()
    // setting in at 0 without the contructor()
    uint public count = 0; // 1, 2, 3

    //write function    
    function incrementCount() public {
        count++;
    }
}