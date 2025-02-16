// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import  "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";// 作者分红能力
import "@openzeppelin/contracts/access/Ownable.sol";// 社区管理者账户控制能力
import "@openzeppelin/contracts/utils/Counters.sol";

contract ArtistNFT is ERC721URIStorage, ERC721Enumerable,ERC721Royalty,Ownable {
    using Counters for Counters.Counter;

    // 每次分配一个tokenid 铸造一个token
    Counters.Counter private _tokenIds;
    uint96 royaltyFraction = 200;
    uint public feeRate = 1 gwei;// 铸币税
    address public feeCollector;// 收税账户

    // 处于管理需要，feeRate 和 feeCollector需要被配置,应该用于公共治理
    function setFeeRate(uint fr) external onlyOwner {
        feeRate=fr;
    }

    function setFeeCollector(address fc) external onlyOwner {
        feeCollector=fc;
    }

    function setFeeRoyaltyFraction(uint96 rf) external onlyOwner {
        royaltyFraction =rf;
    }

    constructor() ERC721("ArtistNFT", "AN") {
        feeCollector=owner();
    }
    function _increaseBalance(address account, uint128 value) internal override (ERC721, ERC721Enumerable){
        super._increaseBalance(account,value);

    }
    function _update(address to, uint256 tokenId, address auth) internal override (ERC721, ERC721Enumerable) returns (address) {
        super._update(to, tokenId, auth);
    }
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721URIStorage, ERC721Enumerable,ERC721Royalty)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    // 获取tokenURI
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    // 铸币，新发行一个NFT资产
    // artist就是原创者，用于接收版权税
    function mint(address artist, string memory tokenURI)
        public
        payable // 社区在铸币时收取铸币税
        returns (uint256)
    {
        require(msg.value > feeRate, "provide fee for comuinty");

        uint256 newItemId = _tokenIds.current();//拿到tokenids计数器当前的值

        // 调用erc721父合约的mint函数
        _mint(artist, newItemId);
        // 设置tokenURI
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();// 计数器递增

        _setTokenRoyalty(newItemId,artist,200);// 把作品的token赋值给自己，并对该token在后续交易中版权费进行归属200=2%
        return newItemId;
    }

    // 提取收取的铸币税

    function withdraw()external  {
        require(msg.sender == feeCollector,"only feecollector can withdraw");
        (bool suc,bytes memory data)=feeCollector.call{value:address(this).balance}("");
        require(suc,"withdraw failed!");
    }
}
