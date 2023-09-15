//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract MyToken {
    mapping(address => uint) public balances;
    mapping(uint => string)public  nameMap;

    uint public id = 0;

    string public name = '_name';

    bool public bool1 = true;

    address public owner;

    int public number1;
    uint public number2;
    uint8 public number3;
    uint256 public number4;
    constructor(){
        owner = msg.sender;
    }

    error InsufficientBalance(uint requested, uint available);

    event Sent(address indexed from, address indexed to, uint256 amount);

    function mint(uint amount) public {
        require(msg.sender == owner);
        balances[msg.sender] += amount;
    }

    function send(uint amount, address to) public {
        if (balances[msg.sender] < amount) {
            revert InsufficientBalance({
                requested:amount,
                available:balances[msg.sender]
            });
        }
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Sent(msg.sender, to, amount);
    }

    function setNumber1(int number) public {
        number1 = number;
    }

    function setNumber2(uint number) public {
        number2 = number;
    }

    function setNumber3(uint8 number) public {
        number3 = number;
    }
    function setNumber4(uint256 number) public {
        number4 = number;
    }

    function getName() public view returns (string memory){
        return name;
    }

}
