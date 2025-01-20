// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

import "contracts/FunctionCall/callee.sol"; // import 导入被调用者的定义

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