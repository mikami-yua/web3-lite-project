// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

interface ABIInterface{
    // interface中没有任何函数的时候abi中是空的
    function setX(uint _x) external  returns(uint); 
    /* abi中对应的数据函数签名
    {
				"inputs": [
					{
						"internalType": "uint256",
						"name": "_x",
						"type": "uint256"
					}
				],
				"name": "setX",
				"outputs": [
					{
						"internalType": "uint256",
						"name": "",
						"type": "uint256"
					}
				],
				"stateMutability": "nonpayable",
				"type": "function"
			}
    */
}