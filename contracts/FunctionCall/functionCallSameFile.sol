// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract Callee{
    uint public  x;
    function setX(uint _x) public {
        x=_x;
    }
}//0x39857B73EcD9846C4aC31371AC42158FcC704023

contract Caller{
    address calleeAddress;
    constructor (address _calleeAddress){
        calleeAddress=_calleeAddress;
    }
    function setCalleeX(uint _x) public {
        Callee callee=Callee(calleeAddress);// 地址类型强制转换为合约类型
        callee.setX(_x);
    }
}