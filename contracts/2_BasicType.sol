// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

contract BasicType{
    function testInt() public pure returns(uint){
        //uint256 i8= 255;
        uint256 max=type(uint256).max;

        uint8 x=8;
        uint16 y=16;
        x=uint8(y);

        return max;
    }

    enum OrderState{layorder,paymen}

    function enumTest()public view returns(OrderState){
        OrderState state=OrderState.paymen;
        return state;
    }
}