// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.6;

import "../../Staking.sol";
import "./TimeHelpersMock.sol";


contract StakingMock is Staking, TimeHelpersMock {
    constructor(IERC20 _stakingToken) Staking(_stakingToken) public {}

    /**
    * @dev Returns the mocked timestamp if it was set, or current `block.timestamp`
    */
    function getTimestamp() internal view override returns (uint256) {
        if (mockedTimestamp != 0) return mockedTimestamp;
        return super.getTimestamp();
    }

    /**
    * @dev Returns the mocked block number if it was set, or current `block.number`
    */
    function getBlockNumber() internal view override returns (uint256) {
        if (mockedBlockNumber != 0) return mockedBlockNumber;
        return super.getBlockNumber();
    }

    function setBlockNumber(uint64 _mockedBlockNumber) public {
        mockedBlockNumber = _mockedBlockNumber;
    }
}
