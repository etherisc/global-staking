// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "../../lib/Checkpointing.sol";


contract CheckpointingMock {
    using Checkpointing for Checkpointing.History;

    Checkpointing.History history;

    function add(uint64 value, uint256 time) public {
        history.add(value, time);
    }

    function getLast() public view returns (uint256) {
        return history.getLast();
    }

    function get(uint64 time) public view returns (uint256) {
        return history.get(time);
    }

    function getHistorySize() public view returns (uint256) {
        return history.history.length;
    }

    function lastUpdate() public view returns (uint256) {
        return history.lastUpdate();
    }
}
