// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract ExternalDemo{
    address public caller;
    function first() public {
        this.second();// this 从内部调用的external的方法
    }

    function second() external  {
        caller=msg.sender;
        // public 不改变 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 （合约内调用）
        // external 会改变 0x7874d94b8f9E2a28FCceCE404666C984f33a82b8（合约间调用，合约给自己发送了一个消息）

    }
}