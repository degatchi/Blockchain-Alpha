// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.4;

interface IMoonCatsRescue {
    function acceptAdoptionOffer(bytes5 catId) payable external;
    function makeAdoptionOfferToAddress(bytes5 catId, uint price, address to) external;
    function giveCat(bytes5 catId, address to) external;
    function catOwners(bytes5 catId) external view returns(address);
    function rescueOrder(uint256 rescueIndex) external view returns(bytes5 catId);
}