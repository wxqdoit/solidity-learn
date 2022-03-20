//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;


contract MappingTest{
    mapping(address=>uint) idMap;
    mapping(uint=>string) nameMap;
    uint id = 0;
    string name = '_name';

    function register(string memory _name) public payable{
        id ++;
        address account = msg.sender;
        idMap[account] = id;
        nameMap[id] = _name;
    }

    function getIdByAddress(address addr) public view returns(uint ){
        return idMap[addr];
    }


    function getNameById(uint _id) public view returns(string memory){
        return nameMap[_id];
    }

    function getName() public view returns(string memory){
        return name;
    }


}
