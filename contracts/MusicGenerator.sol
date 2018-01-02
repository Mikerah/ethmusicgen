pragma solidity ^0.4.18;

/*
 Contract for Music Generator
*/

contract MusicGenerator {
    
    // Owner state variable
    address owner;
    
    // Constructor
    function MusicGenerator() public {
        owner = msg.sender;
    }
    
    // Event of a song's purchase
    event Purchase (address owner, uint price, uint priceToListen, bytes32 songHash);
    
    // Song struct
    struct Song {
        uint price;
        uint priceToListen;
        bytes32 songHash;
    }
    
    // Mapping of owners to songs;
    mapping (address => Song) public songOwnership;
    
    // function used to buy the generated song
    function buySong(uint priceToListen, bytes32 hash) public payable {
        songOwnership[owner].price = msg.value;
        songOwnership[owner].priceToListen = priceToListen;
        songOwnership[owner].songHash = hash;
        
        Purchase(owner, msg.value, priceToListen, hash);
    }
    
    // function used to listen to a song 
    function listenToSong(address listener) public payable {
        if(listener.balance >= songOwnership[owner].priceToListen){
            owner.transfer(songOwnership[owner].priceToListen);
        }
    }
    
}