// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Gas{
    uint public i=0;
    uint public remaind;
    function forever() public {
        // 导致gas费耗尽
        while (true){
            if(i>100){
                return ;
            }
            if (i%10==0){
                remaind=gasleft();
            }
            i+=1;
        }
    }
}//23875

contract GasCaller{
    address gas;
    constructor(address _gas) public {
        gas=_gas;
    }
    function callForever() public {
        bytes memory cd=abi.encodeWithSignature("forever()");
        (bool succ,bytes memory data)=gas.call{gas: 20000}(cd);
        if (!succ){
            revert("transaction failed");
        }
    }
}