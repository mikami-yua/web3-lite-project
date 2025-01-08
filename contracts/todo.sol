// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Todo{

    Task[] tasks;

    struct Task{
        string content;
        bool status;
    }

    constructor(){

    }

    function add(string memory _content) public {
        tasks.push(Task(_content,false));
    }

    function get(uint _id) public {
        return tasks[_id];
    }

    function list() public {}

    function update() public {}

    function remove() public {}
}