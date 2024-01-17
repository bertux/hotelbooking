HOTEL BOOKING WORKSPACE

This workspace contains 3 directories:

1. 'contracts': Holds contract.
2. 'scripts': Contains two typescript files to deploy the contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract.

SCRIPTS

The 'scripts' folder has two typescript files which help to deploy the 'hotelBooking' contract using 'ethers.js' libraries.

For the deployment of any other contract, just update the contract's name from 'hotelBooking' to the desired contract and provide constructor arguments accordingly 
in the file `deploy_with_ethers.ts`

In the 'tests' folder there is a script containing Mocha-Chai unit tests for 'hotelBooking' contract.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.
