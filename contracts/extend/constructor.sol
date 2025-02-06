// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    uint public x = 5;
    constructor(){

    }

}

contract B is A {
 
    constructor(){
        x += 10;
    }
}

contract C is A {

    constructor(){
        x *= 10;
    }
}

contract D is B, C{

}