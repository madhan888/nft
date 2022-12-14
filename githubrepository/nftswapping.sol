pragma solidity ^0.8.13;

import"@openzeppelin/contracts/token/ERC721/ERC721.sol";
import"@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract SWAPNFT{
    address public NFT_ADDRESS;

    constructor(address _NFT_ADDRESS)
    {
        NFT_ADRESS= _NFT_ADDRESS;
    }

    function swapnfft(uint256 _MyTokenID,uint256 _otherTokenID) public
    {
        require(IERC721(NFT_ADDRESS).getApproved(_OtherTokenID) == msg.sender," You are not approved by the owner to swap the NFT");
        require(IERC721(NFT_ADDRESS).ownerOf(_MyTokenID) == msg.sender , "You are not the onwer");
        require(IERC721(NFT_ADDRESS),getApproved(_MyTokenID) == IERC721(NFT.ADDRESS).ownerOf(_OtherTokenID),"You did not approve the other person to swap the NFT");
        IERC721(NFT_ADDRESS).safeTransferFrom(msg.sender,IERC721(NFT_ADDRESS).ownerOf(_OtherTokenID),_MyTokenID,"");
        IERC721(NFT_ADDRESS).safeTransferFrom(IERC721(NFT_ADDRESS).ownerOf(_OtherTokenID),msg.sender,_OtherTokenID,"");

    }
}



    contract MINTNFT is ERC721
    {
     address public immutable owner;
     string public immutable baseuri;

     constructor(string memory _baseuri) ERC721("ETHNIC NFTS","EHN")
     {
         owner=msg.sender;
         baseuri = _baseuri;
     }

     modifier OnlyOwner()
     {
         require(msg.sender owner."Only owner can call this function");
         _;
     }
     
     function mintTicket( uint tokenid) public payable{
         require(msg.value == 1 ether ,"Pay 1 ether to get the ticket");
         _safeMint(msg.sender,tokenid);
     }

     function _baseURI() internal view override virtual returns (string memory){
         return baseuri;
     }

     function withdraw() public onlyOwner
     {
         uint256 amount = address(this).balance;
         (bool result)=payable(owner).call{value:amount}("");
         require(result,"Ether not sent");
     }


    }