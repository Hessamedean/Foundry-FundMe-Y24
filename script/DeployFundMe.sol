// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig(); //now we can get the right address from helper confing for FundMe address
        address ehtUsdPriceFeed = helperConfig.activeNetworkConfig();
        //when we are returning a struct, we need to wrap it in ()
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ehtUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
