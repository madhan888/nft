// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


contract myNFT is ERC721, ERC721Enumerable,Ownable{
 
   using Counters for Counters.Counter;

   Counters.Counter private _tokenIdCounter; 
   uint256 public mintRate=0.01 Ether;
   uint public MAX_SUPPLY=1;

     constructor() ERC721("myNFT","MNFT"){}

     function _baseURI() internal pure override returns (string memory){

         return"https://api.mynft.com/tokens/";
     }

     function safeMint(address to) public payable{
         require(totalSupply)<MAX_SUPPLY,"Can't mint more");
         require(msg.value>=mintRate,"Not enough ether sent");
         _tokenIdCounter.increment();
         _safeMint(to,_tokenIdCounter.current());
     }

    function _beforeTokenTransfer(address from,address to,uint256 tokenId) internal override(ERC721,ERC721Enumerable)
    {
        super._beforeTokenTransfer(from,to,tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721,ERC721Enumerable) returns (bool)
    {
        return  super.supportsInterface(interfaceId);
    }

    function withdraw() public onlyOwner{
        require (address(this).balance >0,"Balance is 0");
        payable(owner()).transfer(address(this).balance);
    }
}
