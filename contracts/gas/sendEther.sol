// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ReceiveEther{
    string public caller;

    receive() external payable { 
        //caller="receive";
    }

    fallback() external payable{
        caller="fallback";    
    }

    function deposit() public  {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract SendEther{
    // 有收款能力，函数被payable修饰具有收钱能力
    // address地址类型用payable修饰，payable指的是收款合约或者有receive函数或者有payable的fallback函数
    // 在旧版本中send和transfer需要用payable修饰address，在新版本中直接调用call进行转账，address可以没有payable函数
    // 一个合约能否收款由一个调用链条来决定
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent=_to.send(msg.value);
        require(sent,"failed to send eth");
    }

    function sendViaCall(address _to) public payable {
        (bool sent,bytes memory data)=_to.call{value:msg.value}("");
        require(sent,"failed to send ether");
    }

    uint public received;// 于合约的balance是一致的

    // 一笔一笔收钱
    function deposit() public payable {
        // 收款不需要特别的实现，只要修饰为payable 调用后就可以转账了
        received+=msg.value;
    }

    function sendTo(address payable _to,uint amount) public {
        (bool sent,bytes memory data)=_to.call{value:amount}("");
        require(sent,"failed to send ether");
    }

    // 模拟address数据类型的send和transfer
    function mySend(address to,uint amount) public returns (bool) {
        // send 和transfer的实现是一个现实gas为2300的函数，防止调用者利用合约恶意破坏
        // 如果receive函数不仅仅是接受，而是干了更多的事情，gas费将不足
        (bool sent,bytes memory data)=to.call{gas:2300,value:amount}("");
        return sent;
    }

    function myTransfer(address to,uint amount) public returns (bool) {
        // send 和transfer的实现是一个现实gas为2300的函数，防止调用者利用合约恶意破坏
        // 如果receive函数不仅仅是接受，而是干了更多的事情，gas费将不足
        (bool sent,bytes memory data)=to.call{gas:2300,value:amount}("");
        require(sent,"Failed to send eth");
        return sent;
    }
}