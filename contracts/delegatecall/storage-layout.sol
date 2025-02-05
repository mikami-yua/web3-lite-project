// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StorageLayout {
    uint public num; // slot 0
    address public sender; // slot 1
    bool success;// slot 1
    uint public value; // slot 2

    Person person; // slot 3 4 5

    struct Person{
        uint  num; // slot 0
        address sender; // slot 1
        bool success;// slot 1
        uint  value; // slot 2
    }

    function setVars(uint _num) public payable{
        num= _num;
        sender =msg.sender;
        value = msg.value;
    }
}