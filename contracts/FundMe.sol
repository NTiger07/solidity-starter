// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 minimumUSD = 5e18;
    address[] funders;
    mapping(address funder => uint amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUSD, "Too less");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        for (
            uint funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; //withdrawing for each user
        }
        funders = new address[](0); //resetting the funders array

        // //transfer
        // payable(msg.sender).transfer(address(this).balance); //automatic revert if fails

        // //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed"); //only reverts if require fails

        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed"); //only reverts if require fails
    }
}
