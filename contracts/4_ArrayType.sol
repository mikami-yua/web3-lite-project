// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract ArrayType{
    uint8[3] data;// 静态数组 成员变量都位于storage中，描述的是合约的持久化状态 data存储在storage中

    uint8[] dynamicData;

    function testStaticArray() public view returns(uint8[3] memory){// 引用类型一定要有存储位置，声明位memory
        uint8 ele=data[0];
        // data[0]=25; view 函数不能修改合约的成员变量
        return data;//这里进行了一次数据拷贝
    } 

    function testStaticArray2() internal  view returns(uint8[3] storage){
        // 公有的函数一定要是memory，合约内部调用可以返回持久化存储的引用，外部调用一定要拷贝到一个memoey变量中去
        return data;
    } 

    function testReadDynamicStorageArray() public view returns(uint8[] memory){
        return dynamicData;
    }

    function testWriteDynamicStorageArray() public {
        dynamicData.push(12);// 程序运行时可以变大
        dynamicData.pop();
        dynamicData.push(90);
    }

    function testMemoryDynamicStorageArray(uint8 size) public view returns(uint8[] memory){
        uint8[] memory mdata =new uint8[](size);//内存数组的初始化，内存中的动态数组，程序运行时才能做初始化
        return mdata;
    }

}