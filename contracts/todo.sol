// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Todo{
    address public  owner;
    Task[] tasks;

    struct Task{
        string content;
        bool status;
    }

    constructor(){
        owner = msg.sender;
    }

    function add(string memory _content) public {
        require(owner==msg.sender);
        tasks.push(Task(_content,false));
    }

    function get(uint _id) public view returns (Task memory) {
        require(owner==msg.sender);
        return tasks[_id];
    }

    function list() public view returns (Task[] memory) {
        require(owner==msg.sender);
        return tasks;
    }

    function toggle(uint _id) public {
        require(owner==msg.sender);
        tasks[_id].status = !(tasks[_id].status);
    }

    function update(uint _id,string memory _content) public {
        require(owner==msg.sender);
        tasks[_id].content=_content;
    }

    function remove(uint _id) public {
        for (uint i=_id;i<tasks.length-1;i++){
            tasks[i]=tasks[i+1];
        }
        tasks.pop();
    }
}