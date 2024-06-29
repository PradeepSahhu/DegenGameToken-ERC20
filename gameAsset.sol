// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract GameAsset is ERC721 {
    uint256 private _nextTokenId;

    constructor()
        ERC721("GameAsset", "GAT")
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmUKHAfQqRsNDdyAtgKkQtkk5atn7t9nuGSpaZ4wh4vcdh";
    }

    function safeMint(address to) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}
