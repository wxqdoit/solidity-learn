//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FunctionTest is ERC20 {
    mapping(address => uint) public balances;

    string public name;
    string public symbol;
    uint public decimals = 18;

    constructor(){
        owner = msg.sender;
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
