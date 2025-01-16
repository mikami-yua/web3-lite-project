// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StructType{
    
    // 定义类型
    struct Person{
        string name;
        uint8 age;
        //测试递归!
        //Person bestFriend; 在声明的时候初始化，如果有递归的存在，会使内存的占用趋向无穷大
    }


    // 一个成员变量天生就是属于storage的，一个局部变量天生就是属于memory的
    // 两个变量在各自属于的位置进行声明的时候就会自动初始化
    Person master;
    //测试struct作为返回值
    function readPerson()public view returns(Person memory){
        
        return master;
    }
    //测试struct作为参数
    function writePerson(Person memory p)public{
        master = p;
    }
    function writePersonName(string memory name)public{
        master.name = name;
    }

    //测试内存struct.对struct来说，memory与storage并没有大的影响
    function testMemoryStruct()public pure returns(Person memory){
        //声明自带初始化！这是递归结构需要考虑的问题...
        Person memory p;//不用new操作，因为struct大小是确定的，不需要一个尺寸参数！
        //这一点跟new动态数组或者bytes、string不同
        p.name = "zhangsan";
        p.age = 25;
        
        return p;
    }


     //测试内存location为storage的局部变量
    function testStorageLocalStruct()public view returns(Person memory){
        Person storage p = master;// memoey 可以自己完成初始化
        // 函数体中是局部变量，不是storage应该在的位置，需要手动初始化
        //下面语句修改了master成员变量！
        // p.name = "zhangsan";
        //p.age = 25;
        
        return p;
    }
}