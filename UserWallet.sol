pragma solidity ^0.4.0;

import "./WalletInterface";
import "./VehicleWallet";

contract UserWallet is WalletInterface {
    
    address owner;
    uint256 private balance;

    //FUNCTIONS
    
    //called immediatly to define owner
	function SimpleWallet() {
	    owner = msg.sender;
	    console.log ("test"); //??
	}
	
    function getBalance(address _owner) {
        return balance;
    }
    
    //EVENTS
    event Deposit   (address from,
                     uint256 amnt);
                     
	event Withdraw  (address _sender,
	                 uint    amnt);
    
    event UserMade (address userAddr,
                    Vehicle v);
    
    //allows owners to deposit
	function deposit(address from, uint256 amnt) {
		if(msg.sender == owner) {
			Deposit(msg.sender, amnt);
		} else {
			throw;
		}
	}
	
	
}