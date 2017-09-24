pragma solidity ^0.4.0;

import "WalletInterface.sol";

contract VehicleWallet is WalletInterface{

    address owner;
    uint256 balance;

    //describes a vehicle
    struct Vehicle{
        address vehicleOwner;       //do you need this
        uint8 id;                   //RFID tag number
    }
    
    //assigns addresses to vehicle ids
    mapping(address => Vehicle) public vehicles;
    

    //FUNCTIONS
    
    //called immediatly to define owner
	function VehicleWallet(){
	    Vehicle vehicle = new vehicle();
	    vehicle.owner = msg.sender().vehicleOwner;
	    vehicle.id = 1;             //hardcoding for demo
	    return vehicle;
	}
	
    function getBalance(){
        return this.balance;
    }
    
    //EVENTS
    event Deposit   (address from,
                     uint256 amnt);
                     
	event Withdraw  (address _sender,
	                 uint    amnt);
    
	function deposit(address from, uint256 amnt, address to){
	    if (amnt >= from.getBalance()
	        || to == owner){
	            throw;
	        }
	   else
	    from.balance--;
	    to.balance++;
	    Deposit(from, amnt);
	}
	
	function withdraw(address from, uint amnt, address to){
	    if (amnt >= from.getBalance()
	        || from == owner){
	        throw;
	    }
	    else
	        from.balance--;
	        to.balance++;
	        Withdraw(from, amnt);
	}
}