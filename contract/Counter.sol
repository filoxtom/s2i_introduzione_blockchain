// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // create a variable
    uint count; // 1, 2, 3

    constructor() public {
        count = 0;
    }

    //read function
    function getCount() public view returns(uint) {
        return count;
    }

    //write function    
    function incrementCount() public {
        count = count + 1;
    }
}