// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

import "contracts/FunctionCall/interfaceCallee.sol";

contract Callee is ICallee{ // 合约实现接口合约，需要实现接口中的所有接口函数
    uint public  x;
    function setX(uint _x) public {
        x=_x;
    }
}