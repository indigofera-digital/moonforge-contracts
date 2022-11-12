// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./Mintable.sol";

contract Asset is ERC721, Mintable {

    string baseURI;
    string public id;

    constructor(
        address _owner,
        string memory _name,
        string memory _symbol,
        string memory _baseURI,
        string memory _id,
        address _imx
    ) ERC721(_name, _symbol) Mintable(_owner, _imx) {
        baseURI = _baseURI;
        id = _id;
    }

    function _mintFor(
        address user,
        uint256 id,
        bytes memory
    ) internal override {
        _safeMint(user, id);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory _baseURI) public onlyOwner {
        baseURI = _baseURI;
    }

    // remove later
    function getbaseURI() public view returns (string memory) {
        return baseURI;
    }
}
