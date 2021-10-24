pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/proxy/Clones.sol";

contract CloneContract {
    
    uint public a = 32;
    address immutable tokenImplementation;
    
    constructor() {
        tokenImplementation = address(new ERC20("sina","srh"));
    }
    
    function createToken() external returns (address) {
        address clone = Clones.clone(tokenImplementation);
        // ERC20(clone).initialize(name, symbol, initialSupply, msg.sender);
        return clone;
    }
}
