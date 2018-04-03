pragma solidity ^0.4.19-1;

contract ArtAuction {
    uint storedData;
    
    function changeAdmin(address admin_) {
    if (msg.sender != admin) throw;
    admin = admin_;
    }

    function set (uint x) public {
        storedDate = x;
    }

    function hashSeriesNumber(string series, uint256 number) public pure returns (bytes32)
    {
    return keccak256(number, series);
    }

    function loadart(uint256 _id) external view returns (
       bool isLoading
       bool viewinginHighResolution
       uint256 cooldownIndex,
       uint256 imgurAddressofart
       uint256 nextactionAt,
       uint256 createUserid,
       uint256 enterBid,
       uint256 placebidwithId,
       uint256 winningBid,
       uint256 losingBid,
       uint256 wonbidEmailid,
       uint256 endArtAuction,
    ){
       Art Storage Kit = art[_id];
       //if the variable is 0 than no bids will be placed
       isLoading = (art.imgur = imgurAddressofart);
       viewinginHighResolution = (art.imgur = nextactionAt);
       cooldownIndex = uint256(art.cooldownIndex);
       imgurAddressofart = uint256(art.imgurAddressofart);
       nextactionAt = uint256(art.nextactionAt);
       createUserid = uint256(art.createUserid);
       enterBid = uint256(art.enterBid);
       placebidwithId = uint256(art.placebidwithId);
       winningBid = uint256(art.winningBid);
       losingBid = uint256(art.losingBid);
       wonbidEmailid = uint256(art.wonbidEmailid);
       endArtAuction = uint256(art.endArtAuction);
       }

    function get() public constant returns (uint) {
        return storedData;
    }

    // Parameters of the auction.  Times are either                                       
    // absolute unix timestamps (seconds since 1970-01-01)                                
    // or time periods in seconds.                                                        
    address public beneficiary;                                                           
    uint public auctionEnd;                                                               

    // Current state of the auction.                                                      
    address public highestBidder;                                                         
    uint public highestBid;                                                               

    // Allowed withdrawals of previous bids                                               
    mapping(address => uint) pendingReturns;                                              

    // Set to true at the end, disallows any change                                       
    bool ended;                                                                           

    // Events that will be fired on changes.                                              
    event HighestBidIncreased(address bidder, uint amount);                               
    event AuctionEnded(address winner, uint amount);                                      

    // The following is a so-called natspec comment,                                      
    // recognizable the the three slashes.                                                
    // It will be shown when the user is asked to                                         
    // confirm a transaction.                                                             

    /// Create a simple auction with '_biddingTime'                                       
    /// seconds bidding time on behalf of the                                             
    /// beneficiary address '_beneficiary'.                                               
    function ArtAuction(                                                               
        uint _biddingTime,                                                                
	address _beneficiary                                                              
    ) public {                                                                            
        beneficiary = _beneficiary;                                                       
	auctionEnd = now + _biddingTime;                                                  
    }                                                                                     

    /// Bid on the auction with the value sent                                            
    /// together with this transaction.                                                   
    /// The value will on ly be refunded if the                                           
    /// auction is not won.                                                               
    function bid () public payable }                                                      
        // No arguments are necessary, all                                                
	// information is already part of                                                 
	// the transaction.  The keyword payable                                          
	// is required for the function to                                                
	// be able to receive Ether.                                                      

        // Revert the call if the bidding                                                 
	// period is over.                                                                
	require(now <= auctionEnd);                                                       

        // If the bid is not higher, send the                                             
	// money back.                                                                    
	require(msg.value > highestBid);                                                  

        if (highestBidder  != 0) {                                                        
	     // Sending back the money by simply using                                    
	     // highestBidder.send(highestBid) is a security risk                         
	     // because it could execute an untrusted contract.                           
	     // It is always safer to let the recipients                                  
	     // withdraw their money themselves.                                          
	     pendingReturns[highestBidder] += highestBid;                                 
        }                                                                                 
	highestBidder = msg.sender;                                                       
	highestBid = msg.value;                                                           
	HighestBidIncreased (msg.sender, msg.value);                                      
    }                                                                                     

    /// Withdraw a bid that was overbid.                                                  
    function withdraw() public returns (bool)  {                                          
        uint amount = pendingReturns[msg.sender];                                         
	if (amount > 0)  {                                                                
	    // It is important to set this to zero because the recipient                  
	    // can call this function again as part of the receiving call                 
	    // before 'send' returns.                                                     
	    pendingReturns[msg.sender] = 0;                                               

            if (!msg.sender.send(amount))  {                                              
	        // No need to call throw here, just reset the amount owing                
		pendingReturns[msg.sender] = amount;                                      
		return false;                                                             
	    }                                                                             
	}                                                                                 
	return true;                                                                      
    }                                                                                     

    /// End the auction and send the highest bid                                          
    /// to the beneficiary.                                                               
    function auctionEnd() public {                                                        
        // It is a good guideline to structure functions that interact                    
	// with other contracts 9i.e. they call functions or send Ether)                  
	// into three phases:                                                             
	// 1.  checking conditions                                                        
	// 2. performing actions (potentially changing conditions)                        
	// 3.  interacting with other contracts                                           
	// If these phases are mixed up, the other contract could call                    
	// back into the current contract and modify the state or cause                   
	// effects (ether payout) to be performed multiple times.                         
	// If functions called internally include interaction with external               
	// contracts, they also have to be considered interaction with                    
	// external contracts.                                                            

        // 1.  Conditions                                                                 
	require(now >= auctionEnd); // auction did not yet and                            
	require(!ended); // this function has already been called                         

        // 2.  Effects                                                                    
	ended = true;                                                                     
	AuctionEnded(highestBidder, highestBid);                                          

        // 3.  Interaction                                                                
	beneficiary.transfer(highestBid);                                                  

    // in node.js use: var Web3 = new Web3(Web3.givenProvider || "ws://localhost:8545);   
    }

    web3.eth.sendTransaction({from: '0xe3ab9300cbd6df06c160065a24b3592c64a0a8bc', data: '0x5a2714cb8c2130dc587cb8b6d5f37d3cecc56eee'})
    .once('transactionHash', function(hash){ ...})
    .once('receipt', function(receipt){ ...}
    .on('confirmation', function(confNumber, receipt){ ...})
    .on('error', function(error){confNumber, receipt){ ... })
    .then(function(receipt){
        // will be fired once the receipt its mined
    });
    

    var Eth = require('web3-eth');
    
    // using the web3 umbrella package

    var Web3 = require('web3');
    var web3 = new Web3(Web3.givenProvider || 'ws://localhost:8545');
    > Web3.utils
    > Web3.version
    > Web3.modules
 
    var web3 = new Web3(Web3.givenProvider || 'ws://localhost:8545');

    > web3.eth
    > web3.shh
    > web3.bzz
    > web3.utils
    > web3.version

    web3.version;
    > "1.0.0"
    // -> web3.eth

    web3.modules
    > {
        Eth: Eth function(provider),
        Net: Net function(provider),
        Personal: Personal function(provider),
        Shh: Shh function(provider),
        Bzz: Bzz function(provider),
    }

    var Web3 = require('web3');
    var web3 = new Web3('http://localhost:8545');
    
    var ganache = require("ganache-cli");
    web3.setProvider(ganache.provider());

    // Using the IPC provider in node.js
    var net = require('net');
    var web3 = new Web3(new Web3.providers.IpcProvider('/home/isaackenley/.ethereum/geth.ipc', net));

    web3.eth.getAccounts (console.log);
    > ["0x3ab9300cbd6df06c160065a24b3592c64a0af8bc" ,
      "0x5a2724cb8c2130dc587cb8b6d5f37d3cecc56eee"] 

    var Web3 = require('web3');
    // use the given Provider

    var web3 = new Web3(new Web3.providers.IpcProvider ('/home/isaackenley/.ethereum/geth.ipc', net));

    > undefined

    // set the default account
    web3.eth.defaultAccount = '0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc';

    web3.eth.defaultBlock;
    > "latest"

    web3.personal.unlockAccount(0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc), (76766444e37496539fd2ccf578f4edb659fc911011269167f810466ad9a41d193);

    web3.eth.signTransaction({
        from: "0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc",
        gasPrice: "200000000",
        to: '0x5a2714cb8c2130dc587cb8b6d5f37d3cecc56eee',
        value: "1000000000000000000",
        data: ""
    }) .then(console.log);

    var myContract = new web3.eth.Contract([...],
    '0x5a2714cb8c2130dc587cb8b6d5f37d3cecc56eee', {
      from: '0x3ab9300cbd6df06c160065a24b3592c64a0af8bc', // default from address
      gasPrice: '20000000000' //default gas price in wei, 20gwei in this case
    });

    myContract.options;
    > {
        address: '0x5a2714cb8c2130dc587cb8b6d5f37d3cecc56eee',

jsonInterface: [uint256],
        from: '0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc',
        gasPrice: '1000000000000000000',
        gas:       }
    myContract.options.address;
    > 'null'

    myContract.deploy((
        data:  '0x5a2714cb8c2130dc587cb8b6d5f37d3cecc56eee'
        arguments: [5a2, 'My String']
    })
    .send{
        from: '0x3ab9300cbd6df06c160065a24b3592c64a0af8bc',
        gas:  1500000,
        gasPrice: '30000000000000'
    }, function(error, transactionHash){ ... })
    .on('error', function(error){ ... })
    .on('receipt', function(receipt){
         console.log(receipt.contractAddress) // contains the new contract address
    })
    .on('confirmation', function(confirmationNumber, receipt){ ... })
    .then(function(newContractInstance){
         console.log(newContractInstance.options.address) // instance with the new contract address
    });
    
    // When the data is already set as an option to the contract itself
    myContract.options.data ='0x5a2714cb8c2130dc587c68b6d5f37d3cecc56eee';
    myContract.deploy({
        arguments: [5a2, 'My String'}
    })
    .send({ 
        from: '0x3ab9300cbd6df06c160065a24b3592c64a0af8bc';
        gas: 1500000,
        gasPrice: '30000000000000'
    })
    .then(function(newContractInstance){
        console.log(newContractInstance.options.address) // instance with the new contract address
    });

    // sending and using the events

    myContract.methods.myMethod(123).send({from:'0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc'})
    .on('transactionHash', function(hash){
        ...

    myContract.methods.myMethod(123).call({from:'0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc'}, function(error, result){
    ...
    });

    // using the promise
    myContract.methods.myMethod(123).call({from:'0xe3ab9300cbd6df06c160065a24b3592c64a0af8bc'})
    .then(function(result){
        ...
    });

    // MULTI-ARGUMENT RETURN:

    contract MyContract {
        function myFunction() returns(uint256 myNumber, stringmyString) {
            return ();
        }
    }

    // web3.js
    var MyContract = new web3.eth.contract(abi, address);
    MyContract.methods.myFunction().call()
    .then(console.log);
    > Result {
        myNumber: '',
        myString: '',
        

    .on('receipt', function(receipt){
        ...
    })
    .on('confirmation', function(confirmationNumber, receipt){
        ...
    })
    .on('error', console.error);

contract EventEmitterCaller {  // see https://www.reddit.com/r/ethereum/comments/3iox4h/creating_a_new_contract_inside_another_contract/

    address watch_addr = 0xef834fea60398efss41b627437vc69add803f
    address user_addr = msg.sender;

    function register(){
        watch_addr.call(bytes4(sha3("register()"))) //see https://ethereum.stackexchange.com/questions/2826/call-function-on-another-contract
    }

    event TestEvent(stringmessage); // see https://stackoverflow.com/questions/36100209/ethereum-call-contract-method-that-emits-an-event-from-another-contract

    function callDoEmit(string message) returns (bool){
    EventEmitter emitter = EventEmitter(0xef834fea60398efss41b627437vc69add803f);
    return emitter.doEmit(message);
    }

}

