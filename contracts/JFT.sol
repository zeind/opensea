// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";
import "@1001-digital/erc721-extensions/contracts/RandomlyAssigned.sol";
import "@1001-digital/erc721-extensions/contracts/LimitedTokensPerWallet.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 */
contract JFT is ERC721Tradable, RandomlyAssigned, Pausable, LimitedTokensPerWallet{
    uint256[] usedTokens;
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("JFT2name", "JFT2", _proxyRegistryAddress)
        RandomlyAssigned(10, 0)
        LimitedTokensPerWallet(2)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmVpuWQfNeZLD3FtWYVDvYfZe2pKp1uDKng3414Y4dYtQN/";
    }

    /**
     * @dev Mints a token to an address with a tokenURI.
     * @param _to address of the future owner of the token
     */
    function mintTo(address _to) public 
        whenNotPaused 
        onlyOwner {
        uint256 token = nextToken();
        usedTokens.push(token);
        _mint(_to, token);
    }

    function getUsedTokens() public view returns(uint256[] memory) {
        return usedTokens;
    }

    function _msgSender()
        internal
        override (ERC721Tradable, Context)
        view
        returns (address sender)
    {
        return ERC721Tradable._msgSender();
    }

    function tokenURI(uint256 _tokenId) override(ERC721Tradable, ERC721) public pure returns (string memory) {
        return ERC721Tradable.tokenURI(_tokenId);
    }

    function isApprovedForAll(address owner, address operator)
        override (ERC721, ERC721Tradable)
        public
        view
        returns (bool)
    {
        return ERC721Tradable.isApprovedForAll(owner, operator);
    }

    function _mint(address to, uint256 tokenId)
        internal virtual override(ERC721, LimitedTokensPerWallet)
    {
        LimitedTokensPerWallet._mint(to, tokenId);
    }

    function _transfer(address from, address to, uint256 tokenId)
        internal virtual override(ERC721, LimitedTokensPerWallet)
    {
        LimitedTokensPerWallet._transfer(from, to, tokenId);
    }
}
