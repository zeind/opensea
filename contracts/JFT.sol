// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";
import "@1001-digital/erc721-extensions/contracts/RandomlyAssigned.sol";

/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 */
contract JFT is ERC721Tradable, RandomlyAssigned {
    uint256[] usedTokens;
    constructor(address _proxyRegistryAddress)
        ERC721Tradable("JFT2name", "JFT2", _proxyRegistryAddress)
        RandomlyAssigned(10, 0)
    {}

    function baseTokenURI() override public pure returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmVpuWQfNeZLD3FtWYVDvYfZe2pKp1uDKng3414Y4dYtQN/";
    }

    /**
     * @dev Mints a token to an address with a tokenURI.
     * @param _to address of the future owner of the token
     */
    function mintTo(address _to) override public onlyOwner {
        uint256 token = nextToken();
        usedTokens.push(token);
        _safeMint(_to, token);
    }

    function totalSupply() public override(WithLimitedSupply, ERC721Tradable) view returns (uint256) {
        return  WithLimitedSupply.totalSupply();
    }

    function getUsedTokens() public view returns(uint256[] memory) {
        return usedTokens;
    }

}
