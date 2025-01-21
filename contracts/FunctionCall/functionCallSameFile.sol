// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract Callee{
    uint public  x;
    address public caller;
    address public eoaAddr;// 指向第一个msg的sender即合约的调用者
    function setX(uint _x) public {
        caller=msg.sender;
        eoaAddr=tx.origin;
        x=_x;
    }
}

contract Caller{
    address calleeAddress;
    address public caller;// 账户的调用者
    address public eoaAddr;
    constructor (address _calleeAddress){
        calleeAddress=_calleeAddress;
    }
    function setCalleeX(uint _x) public {
        caller=msg.sender;
        eoaAddr=tx.origin;
        Callee callee=Callee(calleeAddress);// 地址类型强制转换为合约类型
        callee.setX(_x);
    }
}
// 0xa42b1378D1A84b153eB3e3838aE62870A67a40EA account
// 0xa42b1378D1A84b153eB3e3838aE62870A67a40EA caller
// 0x09197b6faf9f5ADE46D476A0061F0119FB681367 callee（caller合约的地址）