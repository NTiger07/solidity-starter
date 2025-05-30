// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    SimpleStorage public mySimpleStorage;

    function store(uint256 _number) public override {
        myFavouriteNumber = _number + 5;
    }
}
