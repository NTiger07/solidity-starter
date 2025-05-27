// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint256 myFavouriteNumber;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavouriteNumber;

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_name, _favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }
}
