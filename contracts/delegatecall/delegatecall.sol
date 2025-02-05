// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract B {
    // 成员变量需要A合约一致
    uint public num; // slot 0
    address public sender; // slot 1
    uint public value; // slot 2

    uint x;// x与函数无关，可以兼容，代码无影响

    function setVars(uint _num) public payable{
        num= _num;
        sender =msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num; // slot 0
    address public sender; // slot 1
    uint public value; // slot 2
    // 传入被调用合约的多地址
    function setVars(address _contract,uint _num) public payable{
        (bool success,bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}