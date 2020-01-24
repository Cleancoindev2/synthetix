pragma solidity 0.4.25;

import "./Owned.sol";

contract AddressResolver is Owned {

    mapping (bytes32 => address) public repository;

    constructor(address _owner) Owned(_owner) public {}

    function getAddress(bytes32 name) public view returns (address) {
        return repository[name];
    }

    function importAddresses(bytes32[] names, address[] destinations) public onlyOwner
    {
        require(names.length == destinations.length, "Input lengths must match");

        for (uint i = 0; i < names.length; i++) {
            repository[names[i]] = destinations[i];
        }
    }
}