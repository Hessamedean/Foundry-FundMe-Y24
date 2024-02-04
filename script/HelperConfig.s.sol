// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//reson I'm using this mock is to
// first to deploy mocks when we're on a local anvil chain
// second to keep track of contract addresses across different chains

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkConfig {
        // ETH/USD price feed address
        // and now we make two of these functions networkconfig object
        address priceFeed;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfig();
        } else if (block.chainid == 420) {
            //mainnet
            activeNetworkConfig = getOptimismthConfig();
        } else if (block.chainid == 42161) {
            // mainnet
            activeNetworkConfig = getArbitrumethConfig();
        } else if (block.chainid == 1442) {
            //polygonezkEVM testnet
            activeNetworkConfig = getPolygonzkethConfig();
        } else {
            activeNetworkConfig = getorCreateAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
        // this is going to return the configuration
        //for everything we need in sepolia. or any chain
        //what do we need in sepolia? all we need is address.
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfig;
    }

    function getOptimismthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory optimismethConfig = NetworkConfig({
            priceFeed: 0x13e3Ee699D1909E989722E753853AE30b17e08c5
        });
        return optimismethConfig;
    }

    function getArbitrumethConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory arbitrumethConfig = NetworkConfig({
            priceFeed: 0x639Fe6ab55C921f74e7fac1ee960C0B6293ba612
        });
        return arbitrumethConfig;
    }

    function getPolygonzkethConfig()
        public
        pure
        returns (NetworkConfig memory)
    {
        NetworkConfig memory polygonzkethConfig = NetworkConfig({
            priceFeed: 0x97d9F9A00dEE0004BE8ca0A8fa374d486567eE2D
        });
        return polygonzkethConfig;
    }

    function getorCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }
        //only need pricefeed address
        // 1. Deploy the mocks
        // 2. return the mocks address
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_PRICE
        );
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfig;
    }
    // but what if we need more stuff in here. we make a type out of it. using struct key word!!!
}
