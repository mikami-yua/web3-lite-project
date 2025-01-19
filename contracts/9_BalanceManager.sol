// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract BalanceManager{
    // ERC20规范要求,3个view属性的基本成员函数
    // 1.token有名称
    string public name="MyDoller";
    // 2.货币符号
    string public symbol ="MYDOL";
    // 3.货币精度
    uint8 public decimals=4;// 10000个单位相当于一个基本货币


    // 管理一种资产，本质是一种记账
    // 需要不同的钱包记录钱的数量 address 需要mapping类型
    mapping(address=>uint) public balanceOf;// erc20的规范，4.名称需要是of的 
    
    // 初始化账户
    constructor(uint totalBalance){
        // 上下文变量中的msg msg.sender是合约的部署者
        balanceOf[msg.sender]=totalBalance;
    }
    
    // 核心功能是转账
    function transfer(address dst,uint amount) public {
        // src不能通过参数传入，只能从自己的钱包往外转 msg.sender
        address src=msg.sender;

        uint srcBalance=balanceOf[src];
        uint dstBalance=balanceOf[dst];

        require(amount<=srcBalance,"src balance not enough!");
        
        srcBalance-=amount;
        dstBalance+=amount;
        balanceOf[src]=srcBalance;
        balanceOf[dst]=dstBalance;
    } 
    // 0xfAa2867A9303695E805b71E58fA14484635EcCAd

}