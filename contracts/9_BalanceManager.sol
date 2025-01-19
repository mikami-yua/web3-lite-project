// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract BalanceManager{
    // 管理一种资产，本质是一种记账
    // 需要不同的钱包记录钱的数量 address 需要mapping类型
    mapping(address=>uint) public balanceOf;// erc20的规范，名称需要是of的 
    
    // 初始化账户
    constructor(uint totalBalance){
        // 上下文变量中的msg msg.sender是合约的部署者
        balanceOf[msg.sender]=totalBalance;
    }
    
    // 核心功能是转账
    function transfer(address src,address dst,uint amount) public {
        uint srcBalance=balanceOf[src];
        uint dstBalance=balanceOf[dst];

        require(amount<=srcBalance,"src balance not enough!");
        
        srcBalance-=amount;
        dstBalance+=amount;
        balanceOf[src]=srcBalance;
        balanceOf[dst]=dstBalance;
    } 
}