// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract LocalStorageVariable{
    int256[] data1;// 数组类型的，肯定是引用类型的变量
    int256[] data2;

    function getData1() public view returns(int256[] memory){
        return data1;
    } 
    function getData2() public view returns(int256[] memory){
        return data2;
    } 
    function insertData1(int256 d)public {
        return data1.push(d);
    }

    function insertData2(int256 d)public {
        return data2.push(d);
    }

    function setData1ToData2()public {
        // 引用类型的数据，进行赋值时一般语言都是引用拷贝
        // sol中，是将data1中的数据完全变成data2中的数据（搬运）
        data1=data2;
    }

    function testSecondRule(int256[] calldata pd)public  returns(int256[] memory){
        int256[] memory td;
        td=data1;// 穿越存储空间，应该发生值拷贝
        data1=pd;
        //pd=data1; calldata只读
        int256[] calldata cdt=pd;// 不是成员变量，可能是引用拷贝，两个变量的内存区域相同，执行引用拷贝
        return td;
    } 
}