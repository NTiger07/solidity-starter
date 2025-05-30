// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public SimpleStorage;

    function constructSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}
