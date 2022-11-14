// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./Mintable.sol";

contract Asset is ERC721, Mintable {

    string baseURI;

    constructor(
        address _owner,
        string memory _name,
        string memory _symbol,
        string memory _baseURI,
        address _imx
    ) ERC721(_name, _symbol) Mintable(_owner, _imx) {

        string memory uri = string(abi.encodePacked(
            _baseURI,
            address(this),
            "/"
        ));

        setBaseURI(uri);
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
