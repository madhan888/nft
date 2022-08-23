

praga solidity  >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/tokens/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNftLowerGas is ERC721,Ownable{
  
   using Strings for uint256;
   using Counters for Counters.Counter;

   Counters.Counter private supply;

   string public uriPrefix="";
   string public uriSuffix=".json";
   string public hiddenMetadataUri;

   uint256 public cost =0.01 ether;
   uint256 public maxSupply=10000;
   uint256 public maxMintAmountPerTx=5;
 
   bool public paused=true;
   bool public revealed=false;

   constructor() ERC721("NAME","SYMBOL"){
       setHiddenMetadataUri("ipfs:__CID__/hidden.json");
       
   }
  
  modifier mintCompliance(uint256 _minAmount){
      require(_mintAmount > 0 &&_mintAmount <=maxMintAmountPerTx,"Invalid mint amount");
      require(supply.current()+_mintAmount<= maxsupply,"Max supply Exceeded !");               ")
  }

  function totalSupply() public view returns(uint256){
     return supply.current;
  }
    
  funtion mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount){
    require(!paused,"The contract is paused");
    require(msg.value >= cost+_mintAmount,"Insufficient funds!");
    
    _mintLoop(msg.sender,_mintAmount);
  }

  function mintForAddress(uint256 _mintAmount,address _receiver) public mintCompliance (_mintAmount) onlyOwner{
    _mintLoop(_receiver,_mintAmount);
  }
 
  function walletOfOwner(address_owner) public view returns(uint256[] memory)
  {
      uint256 ownerTokenCount = balanceOf(_owner) 
      uint256[] memory ownedTokedIds = new uint256[](ownerTokenCount);
      uint256 currentTokenId = 1;
      uint256 ownedTokenIndex=0;

     while(onwedTokenIndex < ownerTokenCount && currentTokenId <= )
     





  }



}