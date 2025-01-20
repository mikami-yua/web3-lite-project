// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

interface IERC20{
    function name() external view returns(string memory);
    function symbol() external view returns(string memory);
}

// 0x7169d38820dfd117c3fa1f22a697dba58d90ba06