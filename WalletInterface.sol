pragma solidity ^0.4.0;

contract WalletInterface {
    
    address owner;
    uint256 private balance;
    
    //FUNCTIONS
    
    //called immediatly to define owner
	function SimpleWallet() public;
	
    function getBalance(address _owner) constant public returns (uint256);
    
    
    //EVENTS
    event Deposit   (address from,
                     uint256 amnt);
                     
    event Withdraw  (address _sender,
	             uint    amnt);
    
    function deposit(address from, uint256 amnt, address to);
	
    function withdraw(address from, uint amnt, address to);
}
