// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract ContractStructure{
    // 当一个变量被声明为public的时候，会自动生成一个同名的view函数
    uint256 public balance;

    // 并不是函数调用行参的命名，理解为BalanceAdded这种log日志的数据中的字段名称
    event BalanceAdded(uint256 oldValue,uint256 incrc);

    // 函数修饰器,对函数的输入/输出进行约束
    modifier IncrementRange(uint256 _incre){
        // require要求语句，第一个为bool，第二个为提示信息
        require(_incre >100,"too small");
        _;//执行被修饰函数的函数体 
    }

    // 构造函数是public的,特殊的成员函数，在部署的时候被调用
    constructor(uint256 _bal){
        balance = _bal;
    } 

    function balance1() internal  view returns(uint256){
        return balance;
    }

    function addBalance(uint256 _incre) public IncrementRange(_incre) {
        uint256 old=balance;
        balance+=_incre;
        // 记录事件的方式
        emit BalanceAdded(old, _incre);// emit关键字记录日志
    } 
}