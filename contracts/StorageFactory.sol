// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function constructSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _index, uint256 _number) public {
        listOfSimpleStorageContracts[_index].store(_number);
    }

    function sfRetrieve(uint _index) public view returns (uint256) {
        return listOfSimpleStorageContracts[_index].retrieve();
    }
}
