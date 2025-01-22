// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

//import "contracts/FunctionCall/callee.sol"; // import 导入被调用者的定义
// 动态调用不需要import

contract Caller{
    address calleeAddress;
    uint public xx;
    constructor (address _calleeAddress){
        calleeAddress=_calleeAddress;
    }
    // function setCalleeX(uint _x) public {
    //     Callee callee=Callee(calleeAddress);// 地址类型强制转换为合约类型
    //     callee.setX(_x);
    // }

    function setCalleeDynamic(uint _x)public {
        // 动态调用首先获取calldata
        bytes memory cd=abi.encodeWithSignature("setY(uint256)", _x);// 需要使用全程，反射不能用别名
        (bool suc,bytes memory rst)=calleeAddress.call(cd);
        if (!suc){
            revert("call failed");
        }
        // (uint x)=abi.decode(rst, (uint));
        // xx=x;
    }
}