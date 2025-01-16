// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MappingType {
    //改成public...
    mapping(string => uint8) public ages; // 映射只能在storage中
    //public 读操作 array
    mapping(string => mapping(string => uint8)) public ages1;
    function getAge(string memory name) public view returns (uint8) {
         mapping(string => uint8) storage _ages = ages;// 局部变量也要用storage，且指向一个storgae变量
        return ages[name];
    }

    function setAge(string memory name, uint8 age) public {
        // mapping(string => uint8) storage myages = ages;
        ages[name] = age;
    }
    //一般规则：public 的函数参数返回值只能是menory calldata。  internal和private可以是 storage 
    // mappping：只能是storage
    //=》public函数参数或者返回值不可能出现mapping类型 
    
    //写一个internal或private函数，传递storage的mapping
}