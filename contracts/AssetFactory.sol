// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Asset.sol";

contract AssetFactory is Ownable {

    Asset[] collections;

    function createCollection(
        address _owner,
        string memory _name,
        string memory _symbol,
        string memory _baseURI,
        string memory _id,
        address _imx) public onlyOwner {

        Asset asset = new Asset(_owner, _name, _symbol, _baseURI, _id,_imx);
        collections.push(asset);
    }

    function getCollections() public view returns (Asset[] memory) {
        return collections;
    }
}
