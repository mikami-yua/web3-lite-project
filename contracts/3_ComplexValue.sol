// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract ComplexValueType {
    function testAddress()public view  returns(address){
        address addr=msg.sender; // msg全局上下文变量 sender是外部调用者的账户
        return addr;
        // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }

    function testMyAddress() public view returns(address){
        address addr=address(this);// this指本合约，强制转换contract为address类型
        return addr;
        // 0xE5f2A565Ee0Aa9836B4c80a07C8b32aAd7978e22
        // 0xE5f2A565Ee0Aa9836B4c80a07C8b32aAd7978e22
    } 
    

    // Contract type
    function testContract() public view{
        ComplexValueType myContract =this;
    }

    // 定长数组
    function testFixedByteArray() public pure returns(bytes1){
        bytes3 data=0x123456;
        bytes1 u8=data[0];
        //return data;// 0x000000 一个0 4位
        return u8; // 0x12
    } 
}