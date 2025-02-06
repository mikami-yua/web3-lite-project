// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Base {
    string private name; // internal public 定义会与子合约冲突
    event MyEvent();
    modifier myMod(){
        _;
    }

    //function foo() private {}

}

contract ContractA is Base {
    string private name;
    
    // 子合约可以看到父合约的函数修改器和事件，不能重复定义

    function foo() private {
        
    }
}