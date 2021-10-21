pragma solidity ^0.4.22;

// @mickys - based on https://gist.github.com/holiman/069de8d056a531575d2b786df3345665 
contract Replicator {

  address public parent;

  function replicate() public returns(address) {
      address childAddress = clone(address(this));
      Replicator child = Replicator(childAddress);
      child.setParent(address(this));
      return child;
  }

  function setParent(address addr) public {
      parent = addr;
  }

  function clone(address a) public returns(address)  {
    address retval;
    assembly{
        mstore(0x0, or (0x5880730000000000000000000000000000000000000000803b80938091923cF3 ,mul(a,0x1000000000000000000)))
        retval := create(0,0, 32)
    }
    return retval;
 }
}
