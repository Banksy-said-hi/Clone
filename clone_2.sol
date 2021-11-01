pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/proxy/Clones.sol";

contract CloneContract is ERC20 {
    
    
    constructor() ERC20("sina","srh") {
        
    }
    
    
    
    uint[] public balances;
    address[] public owners;
    
    
    
    function fetch(uint[] memory _balances, address[] memory _owners) public {
        for(uint i=0; i<_balances.length; i++) {
            _mint(_owners[i], _balances[i]);
            // balances.push(balances[i]);
            // owners.push(owners[i]);
        }
    }    
    
    function mint(uint _amount) public {
        _mint(msg.sender, _amount);
        owners.push(msg.sender);
        balances.push(_amount);
    } 
    
    function createToken() external returns (address) {
        address child = Clones.clone(address(this));
        CloneContract(child).fetch(balances, owners);
        return child;
    }
}
