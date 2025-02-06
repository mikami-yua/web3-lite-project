// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {

    function foo() public virtual {
   
    }
}

contract B is A {
    function foo() public virtual override {
   
    }
}

contract C is A {
    function foo() public virtual override {
   
    }
}

contract D is B, C {
    // 需要覆盖两个父合约，不能不覆盖，因为继承了两个版本，无法处理继承那个版本
    function foo() public  override(B,C) {
  
    }
}
