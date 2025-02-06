// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 接口中的函数都是虚函数
interface Ibase{
    function foo() external virtual;
}

contract Base {

    // 使用virtual虚函数可以实现父子合约存在同名函数
    function foo() internal view virtual {
        // 函数体中的内容可以使用，也可以不使用，允许后代重新实现
    }

}

contract ContractA is Base {
    
    // 子合约可以看到父合约的函数修改器和事件，不能重复定义

    function foo() internal pure  override  {// 子合约的函数修饰可见性范围要比父合约的更广 可以public继承external
    //计算修饰只能更严格
        
    }
}   