pragma solidity ^0.4.18;

/*
 Contract for Music Generator
*/

contract MusicGenerator {
    
    uint256 public songId = 0;
    
    // Owner state variable
    address owner;
    
    // Constructor
    function MusicGenerator() public {
        owner = msg.sender;
    }
    
    // Event of a song's purchase
    event Purchase(address owner, uint price);
    
    // Event of when someone listens to a song
    event Listen(uint songId, uint priceToListen);
    
    // Song struct
    struct Song {
        address owner;
        uint price;
        uint priceToListen;
        bytes32 songHash;
    }
    
    // Mapping of song ids to songs;
    mapping (uint256 => Song) public songOwnership;
    
    function addSong(uint _price, uint _priceToListen, bytes32 _songHash) public returns (bool){
        songId++;
        songOwnership[songId].owner = msg.sender;
        songOwnership[songId].price = _price;
        songOwnership[songId].priceToListen = _priceToListen;
        songOwnership[songId].songHash = _songHash;
        return true;
    }
    
    // function used to buy the generated song
    function buySong(uint _songId) public payable returns (bytes32) {
        require(songOwnership[_songId].owner != address(0));
        require(msg.value == songOwnership[_songId].price);
        Purchase(msg.sender, msg.value);
        return songOwnership[_songId].songHash;
    }
    
    function getSongInfo(uint _songId) public view returns (address, uint, uint, bytes32) {
        return (songOwnership[_songId].owner,
                songOwnership[_songId].price,
                songOwnership[_songId].priceToListen,
                songOwnership[_songId].songHash);
    }
    
    // function to listen to song
    function listenToSong(uint _songId) public payable returns (bool) {
        require(msg.value == songOwnership[_songId].priceToListen);
        Listen(_songId, songOwnership[_songId].priceToListen);
        return true;
    }
    
    
    function kill() public {
        if(msg.sender == owner){
            selfdestruct(owner);
        }
    }
    
}