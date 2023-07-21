pragma solidity ^0.8.0;

contract Timestamp {
    function reviewtime()public view returns (uint ) {
        return (block.timestamp + 0.5 hours);
    }
}