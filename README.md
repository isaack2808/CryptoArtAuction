//README.md

This is a read me file for writing a test auction smart contract and deploying it onto the ethereum virtual machine using ganache-cli as the testing network.
This is instructions for deploying a smart contract written in the programming language Solidity on an ArchLinux built OS.  This also uses the vim version 8 and vim extensions.
package that is available from the Arch Linux package database.  The goal of this test is to write code in solidity, compile the code and deploy it onto the test-network's blockchain, the ethereum network.  There are many prerequisite packages that are needed to be installed thru arch linux, I'm not going to cover
them all but I will list the following:

solidity, solc, solidity, vim, vimextensions, node-js, git, npm, web3, ganache-cli


I have also created a git repository for this entire project where the files will be saved to.  All smart contracts end  in .sol.
The reason we're deploying onto the testnetwork is that the ethereum test network was created for development.
This is because to launch live smart contracts onto the main ethereum network, they must be funded with  ethereum.
The test network gives you prefunded ethereum accounts that are funded with 100 ethereum in each and can only be used in testing.

The contract I'm writing is an auction smart contract where people are able to bid on items and the winning bid goes to the one with 
highest bidder.  People place bids in ethereum, and the one who wins the auction sends ethereum to the owner of the smart contract.
Those who bid in eth on the auction but lose, are refunded their ethereum.  Their bids are held in the smart contract and can never
be accessed outside the smart contract or by the one who created the smart contract.

In our smart contract we have to configure to interact with a node on the blockchain and get mined.  This is why we have to write code that interacts with
web3, our library that communicates our smart contract over the network and with node.js.  

First we set the web3 var then the modules.
Set the provider (on linux the path is "/users/myuser/.ethereum/geth.ipc" The IPC file is only present when Geth is actually running.
Start Geth and you should see a message like:
                                              # IO219 09   45 48 .128503 NODE/NODE.GO 290 endpoint opened: /users/username/library/ethereum/geth.ipc

We do not need to connect to the internet to run a test network we just need to open geth in a terminal.  This will create the IPC endpoint.  This keeps the testnetwork on a local node and allows you to run the ganache cli interaction with your smart contract locally.
The location displayed above depends on your operating system and you don't want to type this directory path into your
solidity code until you are ready to compile and  you  have geth running in another window so that you can get the above path.

Next we also need to set the value of the variable.
The web3-eth package allows you to interact with an Ethereum blockchain and Ethereum smart contracts (see page 19) of web3.eth

Next we need to connect the variable object to the IPC provider and run a local node, set the property (ethereum account)(these 
by ganache-cli.  Set the property block parameters.  Get a return string (29).
Send the transaction and sign the return string signature.
Set the new contract parameters (ie. var myContract = web3.eth.solauctiontest
Set the properties of the paramters for connecting json interface array.
Set the method calls, set the web3.eth.personal variables so you can interact with the ethereum nodes accounts.
Set the parameters for the .personal, and the providers.  Of course the return parameters.

That's the end of coding the smart contract except for of course the actual smart contract itself.  The above code was just for 
connecting the smart contract with the ethereum blockchain and the json interface via the node.js and the web3 library.
If you would like contribute to this project please commit your code to the branches marked dev.  Thank you

//
