// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.2 <0.9.0;

// 接口不能部署产生实例
interface ICallee {
    function setX(uint _x) external ;// 接口不能public的
}